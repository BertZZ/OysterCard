require_relative 'station'

class OysterCard
  attr_reader :balance, :entry_station, :journey_history
  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

def initialize
  @balance = 0
#  @entry_station = nil
  @journey_history = []
end

def top_up(value)
  if (@balance + value) > BALANCE_LIMIT
    fail "New balance would exceed set limit of #{BALANCE_LIMIT}. You may insert up to #{BALANCE_LIMIT - @balance}."
  else
    @balance += value
  end
end

def touch_in(station)
  if @balance < MINIMUM_BALANCE
    fail 'Not enough money on the card'
  else
    @entry_station = station
  end
end

def touch_out(station)
  deduct(MINIMUM_BALANCE)
  @exit_station = station
  @journey_history << {entry_station: @entry_station, exit_station: @exit_station}
  @entry_station = nil
end

def in_journey?
    @entry_station.nil? ? false : true
end

private

def deduct(value)
    @balance -= value
end

end
