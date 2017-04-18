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
        expect {subject.top_up(max_balance + 1)}.to raise_error 'New balance would exceed set limit of #{BALANCE_LIMIT}'
    end
  end

 end
