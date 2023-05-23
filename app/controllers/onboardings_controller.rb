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
  end

  private

  def onboarding
    @onboarding ||= Onboarding.find(params[:id])
  end
end
