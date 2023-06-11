class AddonsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    change_current_step(3)
  end

end
