require 'test_helper'
require 'main'

class FooTest < Minitest::Test
  def test_bar
    assert Foo.new.bar
  end

  def test_mock
    foo = mock
    foo.expects(:bar).returns(false)

    refute foo.bar
  end
end
