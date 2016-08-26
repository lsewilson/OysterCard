require 'journey_log'

describe JourneyLog do

  subject(:log) {described_class.new(journey_class: journey_class)}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  context '#start' do
    it 'should create a new journey' do
      allow(log.incomplete_journey).to receive(:finish)
      expect(log.start(entry_station)).to eq [journey]
    end
  end

end
