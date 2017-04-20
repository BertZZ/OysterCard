require 'journey'
require 'oyster_card'
require 'station'

describe Journey do
  it 'starts a new journey' do
    card = OysterCard.new
    station = Station.new("Name",2)
    card.top_up(10)
    expect(card.touch_in(station)).to be_a(Journey)
  end
  describe '#end_journey' do
    it 'Ends the journey' do
        card = OysterCard.new
        station = Station.new("Name",2)
        e_station = Station.new("Name2", 1)
        card.top_up(10)
        card.touch_in(station)
        expect(card.touch_out(e_station)).to include(:exit_station => e_station)
     end
   end
end
