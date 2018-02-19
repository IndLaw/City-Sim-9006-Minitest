class Location
	def initialize(name, street, avenue)
		@name = name
		@one_way = nil
		@two_way = nil
		@avenue = avenue
		@street = street
	end

	def name
		@name
	end
	
	#two way
	def new_two_way(location)
		@two_way = location
	end
	
	def two_way
		@two_way
	end
	
	def street
		@street
	end
	#two way
	
	
	#one way
	def new_one_way(location)
		@one_way = location
	end
	
	def one_way
		@one_way
	end
	
	def avenue
		@avenue
	end
	#one way

end

hillman = Location.new("Hillman", "Foo St.", "Fifth Ave.")
hospital = Location.new("Hospital", "Foo St.", "Fourth Ave.")
museum = Location.new("Museum", "Bar St.", "Fifth Ave.")
cathedral = Location.new("Cathedral", "Bar St.", "Fourth Ave.")
downtown = Location.new("Downtown", nil, nil)
monroeville = Location.new("Monroeville", nil, nil)

hillman.new_one_way downtown
hillman.new_two_way hospital

hospital.new_one_way cathedral
hospital.new_two_way museum

cathedral.new_one_way monroeville
cathedral.new_two_way museum

museum.new_one_way hillman
museum.new_two_way cathedral

locations = [hillman, hospital, cathedral, museum]

class Driver
	def initialize(name)
		@name = name
		@location = nil
		@books = 0
		@classes = 0
		@dino_toys = 0
	end
	def name	
		@name
	end
	
	def current_location(location)
		@location = location

	end
	
	def item	
		if location.name == "Hillman"
			@books += 1
		elsif location.name == "Museum"
			@dino_toys += 1
		elsif location.name == "Cathedral"
			if classes == 0
				@classes += 1
			else
				@classes *= 2
			end
		end
	end
	
	def location
		@location
	end
	
	def books
		@books
	end
	
	def classes
		@classes
	end
	
	def dino_toys
		@dino_toys
	end
	
end

driver1 = Driver.new("Driver 1")
driver2 = Driver.new("Driver 2")
driver3 = Driver.new("Driver 3")
driver4 = Driver.new("Driver 4")
driver5 = Driver.new("Driver 5")

drivers = [driver1, driver2, driver3, driver4, driver5]

def random_start_location(driver, seed, locations)
		driver.current_location(locations[seed]) 
end			

def driver_move_print(driver, seed)
	if seed == 0
		puts "#{driver.name} heading from #{driver.location.name} to #{driver.location.one_way.name} via #{driver.location.avenue}"
	elsif seed == 1
		puts "#{driver.name} heading from #{driver.location.name} to #{driver.location.two_way.name} via #{driver.location.street}"
	end
end

def driver_move(driver, seed)
	if seed == 0
		driver.current_location(driver.location.one_way)
	elsif seed == 1
		driver.current_location(driver.location.two_way)
	end
end


def iteration(s, driver)
		driver_move_print(driver, s)
		driver_move(driver, s)
		driver.item
end

def loop(seed, drivers, locations)
	for i in 0..4
	random_start_location(drivers[i], seed.rand(0..3), locations)
	drivers[i].item
		while(drivers[i].location.name != "Downtown" || drivers[i].location.name != "Monroeville")
			iteration(seed.rand(0..2), drivers[i])
			if(drivers[i].location.name == "Downtown" || drivers[i].location.name == "Monroeville")
				break
			end
		end
		
		if(drivers[i].books == 1)
			puts "#{drivers[i].name} obtained #{drivers[i].books} book!"	
		else
			puts "#{drivers[i].name} obtained #{drivers[i].books} books!"	
		end
		
		if(drivers[i].dino_toys == 1)
			puts "#{drivers[i].name} obtained #{drivers[i].dino_toys} dinosaur toy!"
		else
			puts "#{drivers[i].name} obtained #{drivers[i].dino_toys} dinosaur toys!"
		end
		
		if(drivers[i].classes == 1)
			puts "#{drivers[i].name} attended #{drivers[i].classes} class!"
		else
			puts "#{drivers[i].name} attended #{drivers[i].classes} classes!"	
		end
	end
end


def read_arg_and_start(drivers, locations)

	if(ARGV.length > 1)
		puts "Enter a seed and only a seed (RuntimeError)"
	elsif(ARGV.empty?)
		puts "Enter a seed and only a seed (RuntimeError)"
	elsif(ARGV[0].to_i.is_a?(Integer))
		r = Random.new(ARGV[0].to_i)
		loop(r, drivers, locations)
	else
		r = Random.new(0)
		loop(r, drivers, locations)
	end
end


read_arg_and_start(drivers, locations)
