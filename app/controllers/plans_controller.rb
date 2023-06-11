class PlansController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def create
    if selected_plan
      update_account_and_redirect(
        onboarding_addons_path(onboarding),
        onboarding_plans_path(onboarding),
        3
      )
    else
      flash[:alert] = 'Plan is required'
      redirect_to onboarding_plans_path(onboarding)
    end
  end

  def index
    change_current_step(2)
    @account_plan = account.plan || account.build_plan(payment_recurrence: PaymentRecurrence.last)

    @monthly_plans = PaymentRecurrence.with_monthly_plans
    @yearly_plans = PaymentRecurrence.with_yearly_plans
  end

  private

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:onboarding_id])
  end

  def update_account_and_redirect(path_if_success, path_if_fail, next_step_number)
    account.plan = selected_plan

    return account_succesfully_updated(path_if_success, next_step_number) if account.save

    flash[:alert] = account.errors.full_messages.join(', ')
    redirect_to path_if_fail
  end

  def account_succesfully_updated(path_if_success, current_step)
    onboarding.update(current_step:)
    flash[:notice] = 'Plan selected successfully'

    redirect_to path_if_success
  end

  def selected_payment_recurrence
    @selected_payment_recurrence ||= PaymentRecurrence.find_by(
      name: permitted_params[:plan][:payment_recurrence][:name]
    )
  end

  def selected_plan
    plan_name = permitted_params[:plan][:name].split('_')[0]
    @selected_plan ||= Plan.find_by(payment_recurrence: selected_payment_recurrence, name: plan_name)
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
