# require_relative 'game'

class ComputerPlayer #< Player
  attr_reader :code_length, :colours, :set_s
  # include Colourables
  def initialize(colours, code_length)
    @code_length = code_length
    @colours = colours
    @set_s = colours.repeated_permutation(@code_length).to_a
    # @code = COLOURS.sample(4)
    # @code = game.COLOURS.sample(4)
  end
 
  def code_to_break(colours)
    @code = colours.sample(4)
  end

  # def set_s(code_length)
  #   # number_of_colours = Array(0..code_length + 1)
  #   # number_of_colours.repeated_permutation(4).to_a {|perm| p perm }
    
  # end

  def take_a_guess(colours)
    if @guess == nil
      @guess = colours[0], colours[0], colours[1], colours[1]
    else
      @guess = colours.sample(4)
      # puts "#{@set_s[0]}"
      # puts "this is the second guess #{@guess}"
    end
  end
end

  