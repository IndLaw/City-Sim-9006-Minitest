require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_OTHER_PLACES_TEST < Minitest::Test
	# UNIT TESTS FOR METHOD driver_move(driver, seed)

	#Check that one_way value points to downtown location from hillman starting position, program ends
	# EDGE CASE
	def test_to_downtown
		driver = Driver::new("Driver 1")
		hillman = Location::new("Hillman", "Foo St.", "Fifth Ave.")
		downtown = Location::new("Downtown", nil, nil)
		hillman.new_one_way downtown
		
		driver.current_location(hillman)
		driver_move_print(driver, 0)
		driver_move(driver, 0)
		assert_equal downtown, driver.location
	end
	
	#Check that one_way value points to monroeville location from cathedral starting position, program ends
	# EDGE CASE
	def test_to_monroeville
		driver = Driver::new("Driver 1")
		cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
		monroeville = Location::new("Monroeville", nil, nil)
		cathedral.new_one_way monroeville
		
		
		driver.current_location(cathedral)
		driver_move_print(driver, 0)
		driver_move(driver, 0)
		assert_equal monroeville, driver.location
	end


end