class AccountsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def add_plan

  end

  private

  
end
