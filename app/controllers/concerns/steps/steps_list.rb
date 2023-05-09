module Steps
  module StepsList
    def change_current_step(step_number)
      @steps = steps

      @steps.each do |step|
        if step[:number] == step_number
          step[:is_current_step] = true
        end
      end
    end

    private

    def steps
      @steps = [
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
  end
end