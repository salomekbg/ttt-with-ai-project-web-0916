class Board
	attr_accessor :cells

	def initialize
		reset!
	end

	def reset!
		@cells = Array.new(9, " ")
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "	
	end

	def position(location)
		cells[location.to_i - 1]
	end

	def full?
		cells.include?(" ") ? false : true
	end

	def turn_count
		cells.reject {|location| location == " "}.count
	end

	def taken?(location)
		position(location) == "X" || position(location) == "O"
	end

	def valid_move?(location)
		taken?(location) == false && location.to_i.between?(1, 9)
	end

	def update(location, player)
		cells[location.to_i - 1] = player.token
	end
end