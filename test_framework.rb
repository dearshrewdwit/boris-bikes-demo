def assert_equals(val1,val2)
 val1 == val2
end

def it(description, &block)
  print "#{description}: "
  calculator = block.call
  if calculator == true
    puts "Its OK"
  else
    puts "They do not match"
  end
end
