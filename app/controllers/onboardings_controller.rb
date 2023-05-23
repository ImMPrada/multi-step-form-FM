class OnboardingsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    change_current_step(1)
    @onboardings = current_user.onboardings.includes(:account)
  end

  def create
    onboarding = OnboardingProcess.add_new_onboarding_to(current_user)
    select_plan_onboarding_path(onboarding)
  end

  def continue
    redirect_to path_by_step(onboarding.current_step)
  end

  def select_plan
    change_current_step(2)
    @account = onboarding.account
    payment_recurrence = PaymentRecurrence.includes(:plans)
    @account_plan = @account.plan || @account.build_plan(payment_recurrence: payment_recurrence.last)

    @monthly_plans = payment_recurrence.find_by(acronym: 'mo').plans.where(status: 'available')
    @yearly_plans = payment_recurrence.find_by(acronym: 'yo').plans.where(status: 'available')
  end

  def add_plan
    if selected_plan
      update_plan_and_redirect_to(
        select_addons_onboarding_path(onboarding),
        select_plan_onboarding_path(onboarding)
      )
    else
      flash[:alert] = 'Plan is required'
      redirect_to select_plan_onboarding_path(onboarding)
    end
  end

  def select_addons
    change_current_step(3)
  end

  private

  def onboarding
    @onboarding ||= Onboarding.find(params[:id])
  end

  def account
    @account ||= onboarding.account
  end

  def selected_payment_recurrence
    @selected_payment_recurrence ||= PaymentRecurrence.find_by(
      name: permitted_params[:plan][:payment_recurrence][:name]
    )
  end

  def selected_plan
    return unless permitted_params[:plan][:name]

    plan_name = permitted_params[:plan][:name].split('_')[0]
    @selected_plan ||= Plan.where(name: plan_name).find_by(payment_recurrence: selected_payment_recurrence)
  end

  def update_plan_and_redirect_to(target_resource, current_resource)
    account.plan = selected_plan
    if account.save
      account_succesfully_updated(target_resource, 3)
    else
      flash[:alert] = account.errors.full_messages.join(', ')
      redirect_to current_resource
    end
  end

  def account_succesfully_updated(target_resource, current_step)
    onboarding.update(current_step:)
    flash[:notice] = 'Plan selected successfully'
    redirect_to target_resource
  end

  def permitted_params
    params.require(:account).permit(
      plan: [
        :name,
        { payment_recurrence: [:name] }
      ]
    )
  end
end
