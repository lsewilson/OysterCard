require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { double :journey }
  # let(:journey) {{entry_station: entry_station, exit_station: exit_station}}


  describe '#initialize' do
    it 'instantiates with a balance of 0' do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end

    it 'has a default limit' do
      expect(oystercard.limit).to eq Oystercard::DEFAULT_LIMIT
    end

    it 'sets a given limit' do
      oystercard = Oystercard.new 100
      expect(oystercard.limit).to eq 100
    end

    it 'sets a given balance' do
      oystercard = Oystercard.new 100, 50
      expect(oystercard.balance).to eq 50
    end

    it 'raises an error when instantiated balance is larger than limit' do
      msg = 'Balance cannot be larger than limit'
      expect {Oystercard.new 50, 100}.to raise_error msg
    end
end
    # it 'has a minimum fare' do
    #   expect(oystercard.fare).to eq Oystercard::MINIMUM_FARE
    # end

    # it 'is initially not in a journey' do
    #   expect(oystercard).not_to be_in_journey
    # end
    #
    # it 'has an empty list of journeys by default' do
    #   expect(oystercard.journeys).to be_empty
    # end

  describe '#top_up' do

    # it 'confirms new balance after top-up' do
    #   msg = "Your new balance is 10"
    #   expect(oystercard.top_up(10)).to eq msg
    # end

    it 'tops up balance' do
      expect{oystercard.top_up(10)}.to change{oystercard.balance}.by 10
    end

    it 'raises error if limit reached' do
      oystercard.top_up(90)
      msg = 'Balance limit reached'
      expect {oystercard.top_up(1)}.to raise_error msg
    end
  end

  describe '#touch_in' do

    it 'creates a new journey' do
    allow(oystercard).to receive(:new_journey).and_return(journey)
    oystercard.top_up(10)
    oystercard.touch_in(entry_station)
    expect(oystercard.new_journey).to eq journey
    end
  context 'when balance is less than £1' do
    it 'raise an error of insufficient funds' do
      msg = 'Insufficient funds'
      expect { oystercard.touch_in(entry_station) }.to raise_error msg
    end
  end
end
end
    # it 'will remember the entry station after touch in' do
    #   oystercard.top_up(4)
    #   oystercard.touch_in(station)
    #   expect(oystercard.entry_station).to eq station
    # end
    #
    # it 'save the entry station of the current journey' do
    #   subject.top_up(5)
    #   subject.touch_in(entry_station)
    #   expect(Journey.new.start_station).to eq entry_station
    # end

#     it 'should inform the Journey if there was no previous exit station' do
#
#     end
#
#   describe '#touch_out' do
#
#     it 'should inform the current journey about the exit station' do
#
#     end
#
#     it 'should create a new journey if there is no entry station' do
#
#     end
#   end
# end    # it 'will be aware of journey status' do
    # oystercard.top_up(1)
    # oystercard.touch_in(entry_station)
    # oystercard.touch_out(exit_station)
    # expect(oystercard).not_to be_in_journey
    # end

    # it 'will deduct fare amount from card balance' do
    #   oystercard.top_up(5)
    #   oystercard.touch_in(entry_station)
    #   oystercard.touch_out(exit_station)
    #   expect(oystercard.balance).to eq 4
    # end
