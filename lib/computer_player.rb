# require_relative 'game'

class ComputerPlayer #< Player
  attr_reader :code, :colours
  # include Colourables
  def initialize
    # @colours = COLOURS
    # @code = COLOURS.sample(4)
    # @code = game.COLOURS.sample(4)
  end
 
  def code_to_break(colours)
    @code = colours.sample(4)
  end
end

  