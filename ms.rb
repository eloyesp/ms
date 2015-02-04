class Expectation

  def initialize *assertions
    @assertions = assertions
  end

  def match value
    @assertions.each do |assertion|
      if assertion.pass value
        print '·'
      else
        print 'F'
      end
    end
  end

end

class EqualAssertion
  def initialize something
    @expected = something
  end

  def pass value
    value == @expected
  end
end

class NotAssertion
  def initialize assertion
    @assertion = assertion
  end

  def pass value
    !@assertion.pass value
  end
end

def describe something
  yield.match something
end

def equal something
  EqualAssertion.new something
end

def should something
  something
end

def it expectation
  Expectation.new expectation
end

def a_long_operation
  return 4
end

def NOT assertion
  NotAssertion.new assertion
end

describe a_long_operation do
  it should equal 4
end

describe a_long_operation do
  it should NOT equal 5
end
