class Oystercard
  attr_reader :balance
  BALANCE_LIMIT = 90
def initialize
    @balance = 0
end

def top_up(value)
  if (@balance + value) > BALANCE_LIMIT
    fail "New balance would exceed set limit of #{BALANCE_LIMIT}. You may insert up to #{BALANCE_LIMIT - @balance}}"
  else
    @balance += value
    end
  end
end