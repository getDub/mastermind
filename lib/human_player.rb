class HumanPlayer #< Player
      
  attr_accessor :name

  def initialize(name = gets.chomp)
    @name = name
  end

  def players_guess
    player_input = gets.chomp.downcase.split
    
  end

end