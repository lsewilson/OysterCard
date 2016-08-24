require 'journey'
require 'oystercard'

describe Journey do

  subject(:journey) {described_class.new}
  let(:station1) {double :station1}
  let(:station2) {double :station2}

describe '#start' do
  it 'saves station with start method' do
    subject.start(station1)
    expect(subject.entry_station).to eq station1
  end
end
describe '#finish' do
  it 'saves exit station with finish method' do
    subject.finish(station2)
    expect(subject.exit_station).to eq station2
  end
end
describe '#complete?' do
  it 'checks if a journey is complete' do
    subject.start(station1)
    subject.finish(station2)
    expect(subject.complete?).to eq true
  end
end
describe '#fare' do
  it 'should deduct minimum fare from a completed journey' do
    subject.start(station1)
    subject.finish(station2)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it 'should deduct minimum fare from a completed journey' do
    subject.start(station1)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end
  # it 'records the start station' do
  #
  # end
  #
  # it 'records the exit station' do
  #
  # end
  #
  # it 'calculates the fare' do
  #
  # end
  #
  # it 'if no touch in done, applies penalty fare' do
  #
  # end


end
