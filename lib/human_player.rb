class HumanPlayer
      
  attr_accessor :name, :choice, :code

  def initialize(name = gets.chomp)
    @name = name
    @choice = nil
    @code = nil
  end

  def players_guess
    @guess = gets.chomp.downcase.split
  end

  def code_breaker_or_maker?
    @choice = gets.chomp.to_i
  end

  def make_code
    @code = gets.chomp.split
  end
  
end