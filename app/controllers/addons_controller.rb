class AddonsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList

  before_action :authenticate_user!

  def index
    @addons = Addon.all
    @account_addons = account.addons
  end

  def create
    empty_account_addons
    addons_params.each do |_checkbox_id, addoin_id|
      add_addon_to_account(addoin_id) unless addoin_id.to_i.zero?
    end

    redirect_to onboarding_summary_index_path(onboarding)
  end

  private

  def addons_params
    addons_ids = []
    addons.each do |addon|
      addons_ids << "addon_#{addon.id}".to_sym
    end
    params.require(:account).permit(addons_ids)
  end

  def add_addon_to_account(addoin_id)
    account_addon = AccountAddon.new(account:, addon_id: addoin_id)
    account_addon.save
  end

  def empty_account_addons
    account_addons = AccountAddon.where(account:)
    account_addons.destroy_all unless account_addons.empty?
  end

  def addons
    @addons ||= Addon.all
  end

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:onboarding_id])
  end
end
