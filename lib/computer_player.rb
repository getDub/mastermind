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
    # @game = game
    @received_feedback = nil
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
      # puts "this is the second guess #{@guess}"
      # puts "last feed back is #{@received_feedback}"
    end
  end

  def removed_from_s
    #iterate over set s to see what matches feedback.
    @set_s.select! {|element| }
    
  end

  def sent_feedback(feedback)
    @received_feedback = feedback
  end
  
  # def colours_correct?
  #   colours = @guess.each.select do |cols| 
  #     @code.any?(cols)
  #   end
  #     colours.length
  # end

  # def correct_position?
  #   correct_position = @guess.each_with_index.count {|colour, position| @code[position] == colour}
  #   puts [correct_position]
  # end

  
  
end

  