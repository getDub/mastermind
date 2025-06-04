# require_relative 'game'

class ComputerPlayer #< Player
  attr_reader :code, :colours
  include Colourables
  def initialize
    @colours = COLOURS
    @code = COLOURS.sample(4)
  end
 
end

  