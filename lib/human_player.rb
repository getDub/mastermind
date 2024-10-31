class HumanPlayer < Player
      
  attr_accessor :name, :guess

  def initialize(name = gets.chomp)
    @name = name
    @guess
  end

  def players_guess
    # begin
    @guess = gets.chomp.downcase.split
    # rescue 
      # puts "this is the error #{@guess}?"
    # else
      # puts "all good"
    # end

  end

end