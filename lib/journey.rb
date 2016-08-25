require_relative 'oystercard'

class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :entry_station, :journey, :exit_station, :complete

  def initialize(station = @station)
    @entry_station
    @exit_station
    @journey = {entry: 'start' , exit: 'end'}
  end

  def current_journey
    @current_journey
  end

  def start(station)
    #this method was working DRY and needs to be refactored!
    if @complete == false
      PENALTY_FARE
    else
      @complete = false
      @entry_station = station
    end
  end

  def finish(station)
    if complete.nil?
      PENALTY_FARE
    else
      @exit_station = station
      @complete = true
    end
  end

  def complete?
    @complete
    #@entry_station != nil && @exit_station != nil
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end
end
