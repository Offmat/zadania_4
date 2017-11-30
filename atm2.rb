# task from http://main.edu.pl/pl/archive/oi/5/ban
# using binary numbers. I noticed 3 main rules for this task and it works.
require 'pry'

def use_atm(loan)
  [loan, -loan].each.with_index do |money, n| # to check both ways (in/out)
    moves = []
    loan.to_s(2).split('').reverse.each.with_index do |val, i|
      if val == '1'
        if !moves.include?(i)
          moves << i
          moves << i + 1 if (i + n).odd?
        else
          moves.delete(i)
          moves.push(i + 1, i + 2) if (i + n).even?
        end
      end
    end
    moves.reject! { |i| i > 99 }
    result = moves.inject(money) { |sum, i| sum - (-2)**i }
    p result.zero? ? moves.reverse : 'NIE'
  end
end

use_atm(7)
use_atm(68)
use_atm(23)
use_atm(633825300114114700748351602698)
