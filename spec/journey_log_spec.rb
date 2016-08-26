require 'journey_log'

describe JourneyLog do

  subject(:log) {described_class.new(journey_class: journey_class)}
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) {double :journey, incomplete?: false}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  context '#start' do
    it 'should create a new journey' do
      # allow(log.start(entry_station)).to receive(:incomplete_journey).and_return(journey)
      expect(log.start(entry_station)).to eq [journey]
    end
  end
  context '#finish' do
    it 'should add an exit station to the current journey' do
      log.start(entry_station)
      log.finish(exit_station)
      expect(log.journeys).to include journey
    end
  end
end
