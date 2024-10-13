class HumanPlayer #< Player
      
  attr_accessor :name

  def initialize(name = gets.chomp)
    @name = name
  end

  # def get_name
  #   puts 'Hi player, please enter your name.'
  #   # name = 
  #   "Clint" #gets.chomp
  #   # name
  # end
  
  def players_guess
    puts "Please enter your first 4 guesses. No commas just a space between each colour."
    # player_input = 
    gets.chomp.split
  end

end