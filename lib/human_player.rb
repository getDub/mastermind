class HumanPlayer < Player
      
  attr_accessor :name, :guess

  def initialize(name = gets.chomp)
    @name = name
    @guess
  end

  def players_guess
    @guess = gets.chomp.downcase.split
  # @guess = gets.chomp.downcase.split
    # four_colours?
    # @guess
  end

  # def four_colours?
  #   # choose_4 = puts "please choose four colours"
  #   if guess.length != 4 then puts "please choose four colours" 
  #   # guess.length != 4 ? choose_4 : @guess
  #   end
  # end

end