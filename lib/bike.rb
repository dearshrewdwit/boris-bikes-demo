class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report
    @working = false
  end
end
