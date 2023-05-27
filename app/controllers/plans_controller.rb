class PlansController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def create
  end

  def index
    byebug
    @account_plan = account.plan || account.build_plan(payment_recurrence: PaymentRecurrence.last)

    @monthly_plans = PaymentRecurrence.with_monthly_plans
    @yearly_plans = PaymentRecurrence.with_yearly_plans
  end

  def select_addons
    change_current_step(3)
  end

  private

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:onboarding_id])
  end
end
