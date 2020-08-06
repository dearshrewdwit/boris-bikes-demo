# As a member of the public,
# So that I can use a good bike,
# I’d like to see if a bike is working

it 'can show it is working' do
  # set up
  bike = Bike.new

  # execute
  result = bike.working?

  # verify
  assert_equals(result, true)
end

it 'can be reported as broken' do
  # set up
  bike = Bike.new
  bike.report

  # execute
  result = bike.working?

  # verify
  assert_equals(result, false)
end

it 'can be reported as broken even if already broken' do
  # set up
  bike = Bike.new
  bike.report
  bike.report

  # execute
  result = bike.working?

  # verify
  assert_equals(result, false)
end

# As a member of the public,
# So that I reduce the chance of getting a broken bike in future,
# I’d like to report a bike as broken when I return it.
