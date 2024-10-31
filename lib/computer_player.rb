# require_relative 'game'

class ComputerPlayer < Player
  attr_reader :code
  # include Colourables
  def initialize
    @code = COLOURS.sample(4)
  end
 
end

