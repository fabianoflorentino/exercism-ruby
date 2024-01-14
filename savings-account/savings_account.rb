# frozen_string_literal: true

# Module Savings Account
module SavingsAccount
  # Method to get the interest rate based on the current balance
  def self.interest_rate(balance)
    balance_rate(balance)
  end

  # Method to calculate the annual balance update using the interest rate
  def self.annual_balance_update(balance)
    (balance * interest_rate(balance) / 100) + balance
  end

  # Method to calculate the number of years required to reach the desired balance
  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0

    # Loop until the current balance reaches or exceeds the desired balance
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end

    years
  end

  # Method to determine the balance rate based on different balance ranges
  def self.balance_rate(balance)
    return 3.213 if balance.negative?
    return 0.5 if balance < 1000
    return 1.621 if balance < 5000

    2.475 if balance >= 5000
  end
end
