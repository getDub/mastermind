class HumanPlayer < Player
      
  attr_accessor :name, :guess

  def initialize(name = gets.chomp)
    @name = name
    @raw_guess
  end

  def players_guess
    # @guess = gets.chomp.downcase.split
    raw_player_input
    valid_colour2?
    @guess
  end
  
  def raw_player_input
    @raw_guess = gets.chomp.downcase.split
    # p @raw_guess

  end

  def valid_colour2?
    
    @raw_guess.each do |item|
      # p "I dont think this is correct #{item}" if COLOURS.include?(item) == false
      if COLOURS.include?(item) == false
        puts "I think you made at least one typo > '#{item}'.\n Please re-type all four colours."
      players_guess
      else
        @guess = @raw_guess
      end
    end
  end

end