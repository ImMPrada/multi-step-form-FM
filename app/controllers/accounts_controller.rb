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

    @monthly_plans = Plan.where(
      'active = ? AND frequence_unit = ?', true, 'mo'
    ).select(:name, :note, :frequence_number, :frequence_unit, :price)
    @yearly_plans = Plan.where(
      'active = ? AND frequence_unit = ?', true, 'yr'
    ).select(:name, :note, :frequence_number, :frequence_unit, :price)

    @account = account
    @plan = @account.plan || Plan.new
  end

  def add_plan
    @account = account
    @plan = Plan.find_by(
      "LOWER(name) = ? AND frequence_number = 1 AND frequence_unit = ?",
      plan_name.downcase, plan_frequency
    )

    @account.updates(plan: @plan)
    redirect_to select_addons_account_path(@account)
  end

  def select_addons
    steps_current_step(3)
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :phone)
  end

  def plan_params
    params.require(:plan).permit(:plan, :frecuence)
  end

  def plan_frequency
    return unless plan_params[:frecuence]

    plan_params[:frecuence] == 'monthly' ? 'mo' : 'yr'
  end

  def plan_name
    plan_params[:plan].split('_').first
  end

  def account
    Account.find(params[:id])
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
