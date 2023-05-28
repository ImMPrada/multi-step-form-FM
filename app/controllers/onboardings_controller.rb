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
    onboarding_plans_path(@onboarding)
  end

  def show
    redirect_to path_by_step(onboarding)
  end


  def select_addons
    change_current_step(3)
  end

  private

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:id])
  end
end
