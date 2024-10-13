# require_relative 'game'

class ComputerPlayer #< Player
  attr_reader :code
  include Colourables
  # COLOURS = ['Red', 'Green', 'Blue', 'Cyan', 'Pink', 'Yellow'].freeze
  # def random_nums
  #   rando_nums = [] 
  #   POSITIONS.flatten.each do |positions| 
  #     positions = rand(0..5)
  #     rando_nums << positions
  #   end
  #   rando_nums
  # end
  
  # def auto_code_maker
  #   # code_to_break = []
  #   random_nums.each {|positions| code_to_break << COLOURS[positions]}
  #   puts "The Computer has generated a code for you to try and guess...may the force be with you."
  #   p code_to_break
  # end
  def code
    puts COLOURS.sample(4)
  end
end

# player = ComputerPlayer.new
# player.random_colours