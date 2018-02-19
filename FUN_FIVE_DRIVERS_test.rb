require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_FIVE_DRIVERS_TEST < Minitest::Test
	# UNIT TESTS FOR METHOD driver_move_print(driver, seed)

	#Make sure output is correct
	# start at hospital, print that driver moved from hospital to cathedral
	def test_movement_printing_one_way
		driver = Driver::new("Driver 1")
		hospital = Location::new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location::new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location::new("Cathedral", "Bar St.", "Fourth Ave.")
	
		hospital.new_one_way cathedral
		hospital.new_two_way museum

		driver.current_location(hospital)

		driver_move_print(driver, 0)
	end
	
		#check that driver moved from hospital to cathedral worked
		def test_movement_check_one_way
		driver = Driver::new("Driver 1")
		hospital = Location::new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location::new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location::new("Cathedral", "Bar St.", "Fourth Ave.")
	
		hospital.new_one_way cathedral
		hospital.new_two_way museum

		driver.current_location(hospital)
		driver_move(driver, 0)
		assert_equal cathedral, driver.location
	end

	#Make sure output is correct
	# start at hospital, print that driver moved from hospital to museum
	def test_movement_printing_two_way
		driver = Driver::new("Driver 1")
		hospital = Location::new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location::new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location::new("Cathedral", "Bar St.", "Fourth Ave.")
	
		hospital.new_one_way cathedral
		hospital.new_two_way museum

		driver.current_location(hospital)

		driver_move_print(driver, 1)
	end
	
	#check that driver moved from hospital to museum worked
		def test_movement_check_two_way
		driver = Driver::new("Driver 1")
		hospital = Location::new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location::new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location::new("Cathedral", "Bar St.", "Fourth Ave.")
	
		hospital.new_one_way cathedral
		hospital.new_two_way museum

		driver.current_location(hospital)
		driver_move(driver, 1)
		assert_equal museum, driver.location
	end



end