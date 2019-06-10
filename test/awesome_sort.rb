require "test_helper"

class AwesomeSortTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AwesomeSort::VERSION
  end

  def test_that_we_can_add_a_sorter
    AwesomeSort.add_sorter :some_model, :some_attribute, ->(a,b){ "whatever" }

    assert_equal Proc, AwesomeSort.sorters[:some_model][:some_attribute].class
  end
end
