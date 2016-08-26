require_relative './journey.rb'

class JourneyLog

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    add(current_journey(station))
  end

  private

  def incomplete_journey
    @journeys.reject{|journey| journey.complete?}.first
  end

  def current_journey(station)
    incomplete_journey.finish(nil) || @journey_class.new(station)
  end

  def add(journey)
    @journeys << journey
  end


  # complete is a Journey class method, which sets exit
  # station to nil and converts complete status to true

end
