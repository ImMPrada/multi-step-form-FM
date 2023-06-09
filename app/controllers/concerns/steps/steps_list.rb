module Steps
  module StepsList
    extend ActiveSupport::Concern

    included do
      before_action :steps
    end

    def change_current_step(step_number)
      steps.each do |step|
        if step[:number] == step_number
          step[:is_current_step] = true
        end
      end
    end

    private

    def steps
      @steps ||= [
        {
          number: 1, title: 'YOUR INFO', is_current_step: false
        },
        {
          number: 2, title: 'SELECT PLAN', is_current_step: false
        },
        {
          number: 3, title: 'ADD-ONS', is_current_step: false
        },
        {
          number: 4, title: 'SUMMARY', is_current_step: false
        }
      ]
    end

    def path_by_step(onboarding)
      step = onboarding.current_step

      case step
      when 1
        # ...
      when 2
        onboarding_plans_path(onboarding)
      when 3
        onboarding_addons_path(onboarding)
      when 4
        # ...
      else
        raise StandardError, "Step not found"
      end
    end
  end
end
