require_relative 'bike'
class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  def release_bike
    raise "No available bikes" if @bikes.empty?
      @bikes.pop
  end
  def dock(bike)
    raise "docking station full" if full?
      @bikes << bike
  end
  private
  def full?
    @bikes.count >= @capacity
  end
end
