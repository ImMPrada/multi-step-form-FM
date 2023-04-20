class AccountsController < ApplicationController
  def new
    @steps = [
      {
        number: 1,
        title: 'YOUR INFO',
        is_current_step: true
      },
      {
        number: 2,
        title: 'SELECT PLAN',
        is_current_step: false
      },
      {
        number: 3,
        title: 'ADD-ONS',
        is_current_step: false
      },
      {
        number: 4,
        title: 'SUMMARY',
        is_current_step: false
      }
    ]

    @account = Account.new
  end
end
