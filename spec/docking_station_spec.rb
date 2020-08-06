# As a member of the public
# So I can return bikes I’ve hired
# I want to dock my bike at the docking station

it 'can dock a bike' do
  # set up
  docking_station = DockingStation.new
  bike = Bike.new

  # execute
  docking_station.dock(bike)
  result = docking_station.bikes == [bike]

  # verify
  assert_equals(result, true)
end

# As a system maintainer,
# So that I can control the distribution of bikes,
# I’d like docking stations not to accept more bikes than their capacity, which is by default 20.

it 'has a default capacity Const of 20' do
  # set up, execute
  result = DockingStation::CAPACITY

  # verify
  assert_equals(result, 20)
end

it 'can be initialized with a variable capacity' do
  # set up
  capacity = 1
  docking_station = DockingStation.new(capacity: capacity)

  capacity.times do
    docking_station.dock(Bike.new)
  end

  # execute
  result = docking_station.dock(Bike.new)
  # verify
  assert_equals(result, "Sorry, full!")
end

it 'will not dock a bike when at or above capacity' do
  # set up
  docking_station = DockingStation.new
  20.times do
    docking_station.dock(Bike.new)
  end

  # execute
  result = docking_station.dock(Bike.new)

  # verify
  assert_equals(result, "Sorry, full!")
end

# As a member of the public,
# So that I can use a bike,
# I’d like a docking station to release a bike

it 'can release a bike' do
  # set up
  docking_station = DockingStation.new
  bike = Bike.new
  docking_station.dock(bike)

  # execute
  result = docking_station.release
  # verify
  assert_equals(result, bike)
end

it 'releasing a bike removes it' do
  # set up
  docking_station = DockingStation.new
  bike = Bike.new
  docking_station.dock(bike)

  # execute
  docking_station.release
  result = docking_station.bikes
  # verify
  assert_equals(result, [])
end

it 'only releases bikes that are working' do
  # set up
  docking_station = DockingStation.new
  working_bike = Bike.new
  broken_bike = Bike.new
  broken_bike.report
  docking_station.dock(working_bike)
  docking_station.dock(broken_bike)

  # execute
  result = docking_station.release

  # verify
  assert_equals(result, working_bike)
end

# As a member of the public,
# So that I am not confused and charged unnecessarily,
# I’d like docking stations not to release bikes when there are none available.

it 'will not release a bike, when there are none' do
  # set up
  docking_station = DockingStation.new

  # execute
  result = docking_station.release
  # verify
  assert_equals(result, "Sorry, none available")
end

it 'will not release a bike, when there are no working bikes' do
  # set up
  docking_station = DockingStation.new(capacity: 1)
  bike = Bike.new
  bike.report
  docking_station.dock(bike)

  # execute
  result = docking_station.release
  # verify
  assert_equals(result, "Sorry, all are broken")
end
