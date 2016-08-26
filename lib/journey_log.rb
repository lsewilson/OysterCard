require_relative './journey.rb'

class JourneyLog
  attr_reader :journeys
  
  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    add(current_journey(station).end_journey) unless incomplete_journey == nil
    add(@journey_class.new(station))
  end

  def finish(station)
    add(current_journey(station).end_journey(station)) if incomplete_journey == nil
    current_journey(station).end_journey(station) if incomplete_journey != nil
  end

  private

  def incomplete_journey
    @journeys.select{|journey| journey.incomplete? }.first
  end

  def current_journey(station)
    incomplete_journey || @journey_class.new(station)
  end

  def add(journey)
    @journeys << journey
  end


  # complete is a Journey class method, which sets exit
  # station to nil and converts complete status to true

end
