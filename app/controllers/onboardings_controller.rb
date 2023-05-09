class OnboardingsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    change_current_step(1)
  end

  def select_plan
    change_current_step(2)
  end
end
