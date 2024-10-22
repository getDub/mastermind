class HumanPlayer #< Player
      
  attr_accessor :name, :guess

  def initialize(name = gets.chomp)
    @name = name
    @guess
  end

  def players_guess
    @guess = gets.chomp.downcase.split
  end

end