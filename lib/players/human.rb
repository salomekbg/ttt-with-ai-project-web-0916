require_relative '../player.rb'

module Players
	class Human < Player

		def move(board)
			board.display
			puts ""
			puts ""
			puts "What position would you like to play? (1-9)"
			gets.chomp
		end
	end
end