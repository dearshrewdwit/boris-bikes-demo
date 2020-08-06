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
    return "Sorry, all are broken" if all_broken?

    @bikes.find(&:working?)
  end

  private

  def all_broken?
    bikes.none?(&:working?)
  end

  def empty?
    bikes.length == 0
  end

  def full?
    bikes.length >= @capacity
  end
end
