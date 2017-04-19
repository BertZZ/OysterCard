require 'oyster_card'

describe OysterCard do
  let (:station) { double(:station) }
it 'has a balance of 0' do
   expect(subject.balance).to eq(0)
 end
 it 'checks card has empty journey history by default' do
   expect(subject.journey_history).to eq []
 end
describe '#top_up' do
     it 'Updates the balance'do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
 end
    it 'Passes an error if the value on the card would exceed 90' do
        max_balance = OysterCard::BALANCE_LIMIT
        expect{subject.top_up(max_balance + 1)}.to raise_error "New balance would exceed set limit of #{max_balance}. You may insert up to #{max_balance - @balance.to_i}."
    end
  end
describe '#deduct' do
      it 'deducts money from the card'do
        subject.top_up(50)
        expect(subject.send(:deduct, 20)).to eq(30)
      end
end
describe '#touch_in' do
  it 'Touches in' do
    minimum = OysterCard::MINIMUM_BALACE
    subject.top_up(minimum)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end
  it 'Error if card has too little money' do
    expect { subject.touch_in(station) }.to raise_error 'Not enough money on the card'
  end
  it 'Remembers the entry station' do
    subject.top_up(OysterCard::MINIMUM_BALACE)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end
end
describe '#touch_out' do
  it 'Can touch_out' do
    subject.top_up(OysterCard::MINIMUM_BALACE)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.in_journey?).to be_falsey
  end
  it 'Charges you for the journey' do
    expect{subject.touch_out(station)}.to change{subject.balance}.by(-OysterCard::MINIMUM_BALACE)
  end
  it 'Forgets the entry station on Touch Out'do
  subject.touch_out(station)
  expect(subject.entry_station).to eq nil
  end
  it 'saves to journey history upon touching out' do
    subject.top_up(OysterCard::MINIMUM_BALACE)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.journey_history).to eq ( [ {entry_station: station, exit_station: station} ])
  end
end
end
