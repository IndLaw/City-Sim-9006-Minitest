require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_CITY_LOCS_TEST < Minitest::Test


  # Verify that creating a Predictor is an instance of Predictor and not
  # something else.
  # Assertions are how we declare that something is correct with our code.
  # They should state the EXPECTED BEHAVIOR of the system (usually a method,
  # object, or class)
  # assert by itself checks that the following statement returns true
  # refute by itself would check that the following statement returns false
  
  
  # Confirms that creating a location results in a location
  def test_location_is_location
    library = Location::new("Library", nil, nil)
    assert library.is_a?(Location)
  end

  # Very simple test - check that creating a new Location creates
  # a new Location and verifies that it is not nil.
  # refute can be read as "assert not" - that is, refute_nil would
  # be the same as the (nonexistent) "assert_not_nil"
  def test_location_new_not_nil
    library = Location::new("Library", nil, nil)
    refute_nil library
  end

  # Verify that calling the name method returns location name
  #Location name here is "library", the result should equal "library"
  def test_name
    library = Location::new("Library", nil, nil)
    assert_equal "Library", library.name
  end


end