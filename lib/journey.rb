require_relative 'station'

class Journey #It understands your locations
  attr_reader :journey_information
  def initialize(station)
    @journey_information = {:entry_station => station}
  end
  def end_journey(station)
    @journey_information.merge!(:exit_station => station)
  end
end
