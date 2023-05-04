class OnboardingsController < ApplicationController
  layout 'onboarding_application'

  def new
    steps_current_step(1)
    @onboarding = Onboarding.new
    @onboarding.user = User.new
    @onboarding.account = Account.new
  end

  private

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
