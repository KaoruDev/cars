class Car
	@@total_car_count = 0
	@@cars_per_color = {}

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	# Returns total_car_count.
	def self.total_car_count
		@@total_car_count
	end

	# Returns car color that is most popular
	def self.most_popular_color
		most_pop_color = [] # Temporary variable for block
		most_pop_color_count = 0
		p @@cars_per_color

		@@cars_per_color.each { |color, count|
			if count > most_pop_color_count
				most_pop_color_count = count
				most_pop_color = [color]
			end
		}

		p most_pop_color_count

		@@cars_per_color.each_pair { |color, count|
			if count == most_pop_color_count
				most_pop_color.push(color)
			end
		}

		return most_pop_color
	end	


	def initialize(new_car_color) # this is not counting correctly thank.
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		have_seen = false

		if @@cars_per_color == {}
			@@cars_per_color[new_car_color] = 1
		else
			@@cars_per_color.each_key {|color|
				if color == new_car_color
					@@cars_per_color[new_car_color] += 1
				else
					have_seen = true
				end
			}
			@@cars_per_color[new_car_color] = 1 if have_seen
		end

		@car_color = new_car_color.capitalize
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

# Enables car onwers to change the paint of their car and updates
# Car class database.

	def paint_car(new_paint_color)
		new_paint_color.captialize!

		@@cars_per_color.each_key { |color| 
			if color == new_paint_color
				@@cars_per_color[color] += 1
			else
				@@cars_per_color[new_paint_color] = 1	
			end
		}
		
		@@cars_per_color[@car_color] -= 1
		@car_color = new_paint_color
	end
end

car_a = Car.new("Green")
car_b = Car.new("Red")
car_c = Car.new("Blue")
car_d = Car.new("Blue")
car_e = Car.new("Blue")
car_f = Car.new("Red")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b