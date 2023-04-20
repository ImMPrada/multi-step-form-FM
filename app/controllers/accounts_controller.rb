class AccountsController < ApplicationController
  def new
    steps_current_step(1)

    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to select_plan_account_path(@account)
    end
  end

  def select_plan
    steps_current_step(2)

    cookies[:plans_monthly] = Plan.where('active = ? AND frequence_unit = ?', true, 'mo').select(:name, :note, :frequence_number, :frequence_unit)
    cookies[:plans_yearly] = Plan.where('active = ? AND frequence_unit = ?', true, 'yr').select(:name, :note, :frequence_number, :frequence_unit)
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :phone)
  end

  def steps_current_step(current_step_number)
    @steps = [
      {
        number: 1,
        title: 'YOUR INFO',
        is_current_step: false
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

    @steps.each do |step|
      if step[:number] == current_step_number
        step[:is_current_step] = true
      end
    end
  end
end
