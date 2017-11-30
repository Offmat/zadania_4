# task from http://main.edu.pl/pl/archive/oi/5/ban
# solution without binary numbers. special conditions for "1" and "-1"
def next_value(value, array)
  i = value > 0 ? 0 : 1
  index = value == -1 ? 1 : false
  sum = 0
  while i < 100
    if array[i].abs <= value.abs
      sum += array[i].abs
      i += 2
      index = i
      next
    end
    method = sum >= value.abs ? :sum : :cut
    return [index, method]
  end
  method = sum >= value.abs ? :sum : :cut
  return [index, method]
end

# positive value means user wants to borrow money
def try_to_loan(loan)
  atms = Array.new(100) { |i| i.even? ? 2**i : -2**i }
  signs = atms.dup
  moves = []
  while loan != 0
    # binding.pry
    first_bigger, method = next_value(loan, atms)
    break if first_bigger == false
    if method == :cut
      moves << signs.index(atms[first_bigger])
      loan -= atms.delete_at(first_bigger)
      moves << signs.index(atms[first_bigger - 1]) if loan != 1
      loan -= atms.delete_at(first_bigger - 1) if loan != 1
    else
      moves << signs.index(atms[first_bigger - 2])
      loan -= atms.delete_at(first_bigger - 2)
    end
    p moves
    p loan
  end
end


try_to_loan(-633825300114114700748351602698)
