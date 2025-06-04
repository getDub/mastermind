class HumanPlayer #< Player
      
  attr_accessor :name, :guess, :choice, :code

  def initialize(name = gets.chomp)
    @name = name
    @guess
    @choice = nil
    @code
  end

  def players_guess
    @guess = gets.chomp.downcase.split
  end

  def code_breaker_or_maker?
    @choice = gets.chomp.to_i
    # puts @choice.class
  end

  def make_code
    @code = gets.chomp.split#.map(&:capitalize)
    puts @code
  end
  
end