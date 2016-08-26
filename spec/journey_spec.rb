require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  subject(:journey2) {described_class.new(entry_station)}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe '#start' do
    it 'saves an entry station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe '#incomplete?' do
    it 'checks if a journey is complete' do
      journey2.finish(exit_station)
      expect(journey2.incomplete?).to eq false
    end
  end

  describe '#fare' do
    it 'should return miniumum fare when journey complete' do
      journey2.finish(exit_station)
      expect(journey2.fare).to eq Journey::MINIMUM_FARE
    end

    it 'should charge penalty if the user did not previously touch in' do
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'should charge penalty if previously did not touch out' do
      journey2.start(entry_station)
      expect(journey2.fare).to eq Journey::PENALTY_FARE
    end
  end
end
