require_relative 'journey'

class Oystercard

  attr_reader :balance, :limit, :fare, :entry_station

  DEFAULT_LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1

  def initialize(limit = DEFAULT_LIMIT, balance = DEFAULT_BALANCE)
    @limit = limit
    @balance = balance
    @fare = MINIMUM_FARE
    @journeys = []
    fail 'Balance cannot be larger than limit' if balance > limit
  end

  def top_up(amount)
    fail 'Balance limit reached' if full? || amount > limit
    @balance += amount
    balance_confirmation
  end

  def touch_in(entry_station)
    fail 'Insufficient funds' if balance < fare

    # new_journey(entry_station)
    # # @current_journey.start(entry_station)
  end

  def touch_out(station)
    deduct(fare)
    # record_journey(station)
    @entry_station = nil
  end

  def new_journey
    @current_journey = Journey.new
  end

  private

  def full?
    @balance >= limit
  end

  def balance_confirmation
    "Your new balance is #{balance}"
  end

  def deduct(amount)
    fail 'Insufficient funds' if amount > balance
    @balance -= amount
    balance_confirmation
  end

  def record_journey(station)
    @journeys << {entry_station: @entry_station, exit_station: station}
  end

end
