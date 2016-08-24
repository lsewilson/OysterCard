require_relative 'oystercard'

class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :entry_station, :journey, :exit_station

  def initialize(station = @station)
    @entry_station
    @exit_station
    @journey = {entry: 'start' , exit: 'end'}
  end

  def current_journey
    @current_journey
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end
end
