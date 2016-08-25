require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe '#start' do
    it 'saves an entry station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end
  # describe '#finish' do
  #   it 'saves an exit station' do
  #     journey.start(entry_station)
  #     journey.finish(exit_station)
  #     expect(journey.exit_station).to eq exit_station
  #   end
  # end
  describe '#complete?' do
    it 'checks if a journey is complete' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.complete?).to eq true
    end
  end
  describe '#fare' do
    it 'should return miniumum fare when journey complete' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'should charge penalty if the user did not previously touch in' do
      expect(journey.finish(exit_station)).to eq Journey::PENALTY_FARE
    end

    it 'should charge penalty if previously did not touch out' do
      journey.start(entry_station)
      expect(journey.start(entry_station)).to eq Journey::PENALTY_FARE
    end
  end
end
