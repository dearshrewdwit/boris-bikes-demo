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
