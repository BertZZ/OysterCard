require 'oyster_card'

describe Oystercard do
 it 'has a balance of 0' do
   expect(subject.balance).to eq(0)
 end
describe '#top_up' do
     it 'Updates the balance'do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
 end
      it 'Passes an error if the value on the card would exceed 90' do
        max_balance = Oystercard::BALANCE_LIMIT
        expect{subject.top_up(max_balance + 1)}.to raise_error "New balance would exceed set limit of #{BALANCE_LIMIT}. You may insert up to #{BALANCE_LIMIT - @balance}."
    end
  end
describe '#deduct'do
      it 'deducts money from the card'do
        subject.top_up(50)
        expect(subject.deduct(20)).to eq(30)
      end
end
describe '#in_journey?'do
  it 'is not in a journey'do
    expect(subject).not_to be_in_journey
  end
end
describe '#touch_in'do
  it 'Touches in' do
    subject.top_up(MINIMUM_BALACE)
    subject.touch_in
    expect(subject).to be_in_journey
  end
  it 'Error if card has too little money'do
    expect{subject.touch_in}.to raise_error "Not enough money on the card"
  end
end

describe '#touch_out'do
  it "Can touch_out" do
    subject.top_up(MINIMUM_BALACE)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
end
end
