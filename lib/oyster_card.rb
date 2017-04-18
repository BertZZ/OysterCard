class Oystercard
attr_reader :balance

def initialize
    @balance = 0
end

BALANCE_LIMIT = 90
MINIMUM_BALACE = 1

def top_up(value)
  if (@balance + value) > BALANCE_LIMIT
    fail "New balance would exceed set limit of #{BALANCE_LIMIT} You may insert up to #{BALANCE_LIMIT - @balance}."
  else
    @balance += value
    end
end

def deduct(value)
    @balance -= value
end
def touch_in
  if @balance < 1
    fail "Not enough money on the card"
  else
    @journey = true
  end
end

def touch_out
  @journey = false
end

def in_journey?
    @journey
end
end
