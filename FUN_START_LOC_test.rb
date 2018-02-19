require 'minitest/autorun'
require_relative 'city_sim_9006.rb'


class FUN_START_LOC_TEST < Minitest::Test
	# UNIT TESTS FOR METHOD random_start_location(driver, seed, locations)
	
	#checks that any seed gives driver an initial starting location
	def test_check_if_location
		driver = Driver::new("Driver")
		
		hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
		locations = [hillman]
		
		random_start_location(driver, 0, locations)
		assert driver.location.is_a?(Location)
	end

	#confirm that seed value 0 gives location hillman
	def test_location_0
		driver = Driver::new("Driver")
		
		hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
		hospital = Location.new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location.new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
		
		locations = [hillman, hospital, cathedral, museum]
		
		random_start_location(driver, 0, locations)
		assert_equal hillman, driver.location
	end
	
		#confirm that seed value 1 gives location hospital
	def test_location_1
		driver = Driver::new("Driver")
		
		hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
		hospital = Location.new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location.new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
		
		locations = [hillman, hospital, cathedral, museum]
		
		random_start_location(driver, 1, locations)
		assert_equal hospital, driver.location
	end
	
		#confirm that seed value 2 gives location cathedral
	def test_location_2
		driver = Driver::new("Driver")
		
		hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
		hospital = Location.new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location.new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
		
		locations = [hillman, hospital, cathedral, museum]
		
		random_start_location(driver, 2, locations)
		assert_equal cathedral, driver.location
	end
	
		#confirm that seed value 3 gives location museum
	def test_location_3
		driver = Driver::new("Driver")
		
		hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
		hospital = Location.new("Hospital", "Foo St.", "Fourth Ave.")
		museum = Location.new("Museum", "Bar St.", "Fifth Ave.")
		cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
		
		locations = [hillman, hospital, cathedral, museum]
		
		random_start_location(driver, 3, locations)
		assert_equal museum, driver.location
	end

end