require "test_helper"

class Common::ResponderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Common::Responders::VERSION
  end
end
