class OnboardingsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    change_current_step(1)
    @onboardings = current_user.onboardings.includes(:account)
  end

  def create
    @onboarding = OnboardingProcess.add_new_onboarding_to(current_user)
    select_plan_onboarding_path(@onboarding)
  end

  def continue
    redirect_to path_by_step(onboarding.current_step)
  end

  def select_plan
    change_current_step(2)
    @account = onboarding.account
    @account_plan = @account.plan || @account.build_plan(payment_recurrence: PaymentRecurrence.last)

    @monthly_plans = PaymentRecurrence.with_monthly_plans
    @yearly_plans = PaymentRecurrence.with_yearly_plans
  end

  def select_addons
    change_current_step(3)
  end

  private

  def onboarding
    @onboarding ||= Onboarding.find(params[:id])
  end
end
