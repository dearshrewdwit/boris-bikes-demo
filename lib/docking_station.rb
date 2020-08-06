class DockingStation
  CAPACITY = 20
  attr_reader :bikes

  def initialize(capacity: CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    return "Sorry, full!" if full?

    @bikes << bike
  end

  def release
    return "Sorry, none available" if empty?

    @bikes.pop
  end

  private

  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length >= @capacity
  end
end
