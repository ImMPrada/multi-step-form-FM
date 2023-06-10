class AddonsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    @addons = Addon.all
    @account_addons = account.addons
  end

  def create
    byebug
  end

  private

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:onboarding_id])
  end

end
