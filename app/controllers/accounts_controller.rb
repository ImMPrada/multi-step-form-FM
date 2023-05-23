class AccountsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def add_plan
    if selected_plan
      update_account_and_redirect(
        select_addons_onboarding_path(onboarding),
        select_plan_onboarding_path(onboarding),
        3
      )
    else
      flash[:alert] = 'Plan is required'
      redirect_to select_plan_onboarding_path(onboarding)
    end
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
    return account.plan unless permitted_params[:plan][:name]

    plan_name = permitted_params[:plan][:name].split('_')[0]
    @selected_plan ||= Plan.where(name: plan_name).find_by(payment_recurrence: selected_payment_recurrence)
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

  def permitted_params
    params.require(:account).permit(
      plan: [
        :name,
        { payment_recurrence: [:name] }
      ]
    )
  end
end
