require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_STREETS_TEST < Minitest::Test
	# UNIT TESTS FOR METHOD new_two_way(location)

	#Check that two_way value points to hospital location
	# EDGE CASE
	def test_two_way_relation
		hillman = Location::new("Hillman", nil, nil)
		hospital = Location::new("Hospital", nil, nil)
		hillman.new_two_way(hospital)
		assert_equal hospital, hillman.two_way
	end
	
	#Confirm two_way is a location after creation
	def test_two_way_is_location
    	hillman = Location::new("Hillman", nil, nil)
		hospital = Location::new("Hospital", nil, nil)
		hillman.new_two_way(hospital)
		assert hillman.two_way.is_a?(Location)
	end
	
	#Confirm two_way value is not nil
	def test_new_two_way_not_nil
        hillman = Location::new("Hillman", nil, nil)
		hospital = Location::new("Hospital", nil, nil)
		hillman.new_two_way(hospital)
		refute_nil hillman.two_way
	end
	
	#confirm that hillman is connected to Foo St.
	def test_street_connection
		hillman = Location::new("Hillman", "Foo St.", nil)
		assert_equal "Foo St.", hillman.street
	end


end