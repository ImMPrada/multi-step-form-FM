class AddonsController < ApplicationController
  layout 'onboarding_application'
  include Steps::StepsList
  include Assignable

  before_action :authenticate_user!

  def index
    change_current_step(3)
    @addons = Addon.all
    @account_addons = account.addons
  end

  def create
    empty_account_addons
    addons_params.each do |_checkbox_id, addoin_id|
      account.addons << addon(addoin_id) unless addoin_id.to_i.zero?
    end

    update_account_and_redirect(
      onboarding_summary_index_path(onboarding),
      onboarding_addons_path(onboarding),
      3,
      account
    )
  end

  private

  def addons_params
    addons_ids = []
    addons.each do |addon|
      addons_ids << "addon_#{addon.id}".to_sym
    end
    params.require(:account).permit(addons_ids)
  end

  def empty_account_addons
    account_addons = AccountAddon.where(account:)
    account_addons.destroy_all unless account_addons.empty?
  end

  def addons
    @addons ||= Addon.all
  end

  def addon(addon_id)
    Addon.find(addon_id)
  end

  def account
    @account ||= onboarding.account
  end

  def onboarding
    @onboarding ||= Onboarding.find(params[:onboarding_id])
  end
end
