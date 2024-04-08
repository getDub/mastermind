# Codemaker
colored_pegs = ['Red', 'Green', 'Blue', 'Cyan', 'Magenta', 'Yellow']
$peg_positions = [[1, 2, 3, 4]]

def peg_board
  row = '-------+-------+-------+-------'
  $peg_positions.each do |positions|
    puts positions.join('   |   ').insert(0, '   ')
    puts row
  end
end
peg_board

def random_code_maker(arr)
  code = []
  4.times do 
    code << arr[Random.rand(0..5)]
  end
  p code
end

random_code_maker(colored_pegs)

# Codebreaker