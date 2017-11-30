# task from http://main.edu.pl/pl/archive/oi/5/ban
# best solution for now (probably last one)
require 'pry'

def use_atm(loan)
  2.times do |n|
    withdraw = Array.new(100) { |x| (x + n).even? ? '1' : '0' }
    value = withdraw.reverse.join.to_i(2) - loan
    moves = []
    value.to_s(2).split('').reverse.each.with_index do |val, index|
      moves << index if val.to_i ^ withdraw[index].to_i != 0
    end if value >= 0
    p moves.empty? ? 'NIE' : moves.reverse
  end
end

use_atm(7)
use_atm(68)
use_atm(23)
use_atm(633825300114114700748351602698)
