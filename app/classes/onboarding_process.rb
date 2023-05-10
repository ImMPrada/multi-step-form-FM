class OnboardingProcess
  def self.add_new_onboarding_to(user)
    account = Account.new(name: "account_#{user.accounts.count + 1}")

    if account.save
      onboarding = Onboarding.new(
        token: SecureRandom.hex(1000),
        status: 'in_progress',
        current_step: 2,
        owner: user,
        account:
      )
    end

    return nil unless onboarding&.save

    onboarding
  end
end
