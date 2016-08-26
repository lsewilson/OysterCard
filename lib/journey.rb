require_relative 'oystercard'

class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :entry_station, :journey, :exit_station, :complete

  def initialize(station = nil)
    @entry_station = station
    @complete = false
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    @complete = true
    self
  end

  def incomplete?
    !entry_station || !exit_station
  end

  def fare
    incomplete? ?  PENALTY_FARE : MINIMUM_FARE
  end
end
