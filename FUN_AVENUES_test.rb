require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_AVENUES_TEST < Minitest::Test
	# UNIT TESTS FOR METHOD new_one_way(location)

	#Check that one_way value points to downtown location
	# EDGE CASE
	def test_one_way_relation
		hillman = Location::new("Hillman", nil, nil)
		downtown = Location::new("Downtown", nil, nil)
		hillman.new_one_way(downtown)
		assert_equal downtown, hillman.one_way
	end
	
	#Confirm one_way is a location after creation
	def test_one_way_is_location
    	hillman = Location::new("Hillman", nil, nil)
		downtown = Location::new("Downtown", nil, nil)
		hillman.new_one_way(downtown)
		assert hillman.one_way.is_a?(Location)
	end
	
	#Make sure one_way value is not nil
	def test_new_two_way_not_nil
        hillman = Location::new("Hillman", nil, nil)
		downtown = Location::new("Downtown", nil, nil)
		hillman.new_one_way(downtown)
		refute_nil hillman.one_way
	end
	
	#confirm that hillman is connected to fifth avenue
	def test_avenue_connection
		hillman = Location::new("Hillman", nil , "Fifth Ave.")
		assert_equal "Fifth Ave.", hillman.avenue
	
	end

end