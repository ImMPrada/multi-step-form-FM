class OnboardingsController < ApplicationController
  layout 'onboarding_application'

  def new
    @onboarding = Onboarding.new
    @onboarding.user = User.new
    @onboarding.account = Account.new
  end
end
