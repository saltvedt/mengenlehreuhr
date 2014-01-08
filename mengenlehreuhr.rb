class Mengenlehreuhr
	def initialize (time)
		input = time.split(":")
		@hours = input[0].to_i
		@minutes = input[1].to_i
		@seconds = input[2].to_i
	end

	def top_light
		((@seconds % 2) == 0) ? "Y" : "O"
	end

	def first_row
		num_of_lights = @hours / 5
		("R" * num_of_lights) + ("O" * (4 - num_of_lights))
	end
			
	def second_row
		num_of_lights = @hours % 5
		("R" * num_of_lights) + ("O" * (4 - num_of_lights))
	end

	def third_row
		num_of_lights = @minutes / 5
		indicate_quarters(("Y" * num_of_lights) + ("O" * (11 - num_of_lights)))
	end

	def fourth_row
		num_of_lights = @minutes % 5
		("Y" * num_of_lights) + ("O" * (4 - num_of_lights))
	end

	def to_s
		[top_light, first_row, second_row, third_row, fourth_row].join("\n")
	end

	private

	def indicate_quarters (string)
		quarter_indicator_positions = [2,5,8]

		new_string = ""
		string.split("").each_with_index do |char, index|
			if quarter_indicator_positions.include? (index) and char == "Y"
				new_string += "R"
			elsif char == "Y"
				new_string += "Y"
			else
				new_string += "O"
			end
		end

		return new_string
	end
end

uhr = Mengenlehreuhr.new("13:17:01")
p uhr