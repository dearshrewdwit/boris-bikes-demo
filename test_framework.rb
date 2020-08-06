require 'colorize'

COLOURS = {
  true => :green,
  false => :red
}

def assert_equals(val1,val2)
 val1 == val2
end

def it(description, &block)
  assertion = block.call
  result = if assertion
    "PASSED"
  else
    "FAILED"
  end
  puts "#{description}: #{result}".send(COLOURS[assertion])
end
