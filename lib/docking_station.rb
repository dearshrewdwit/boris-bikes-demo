class DockingStation
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def release
    @bikes.pop
  end
end
