class OnboardingsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  # def new
  #   steps_list(1)
  #   @onboarding = Onboarding.new
  #   @onboarding.owner = User.new
  #   @onboarding.account = Account.new
  # end

  def show
    change_current_step(2)
  end
end
