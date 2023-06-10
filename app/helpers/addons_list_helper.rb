module AddonsListHelper
  def addon_selected?(account_addons, addon)
    account_addons.include?(addon)
  end
end
