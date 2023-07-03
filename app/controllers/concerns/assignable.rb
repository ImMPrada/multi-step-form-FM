module Assignable
  extend ActiveSupport::Concern

  def update_account_and_redirect(
    path_if_success,
    path_if_fail,
    next_step_number,
    account_to_save
  )
    return account_succesfully_updated(path_if_success, next_step_number) if account_to_save.save

    flash[:alert] = account_to_save.errors.full_messages.join(', ')
    redirect_to path_if_fail
  end

  def account_succesfully_updated(path_if_success, current_step)
    onboarding.update(current_step:)
    flash[:notice] = 'Account updated successfully'

    redirect_to path_if_success
  end
end
