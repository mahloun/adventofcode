require 'set'
require_relative 'input'

def parse input
  rule = { "^" => [1, 0], ">" => [0, 1], "v" => [-1, 0], "<" => [0, -1] }
  input.map { |caracter| rule[caracter] }
end

def deliver position = [0, 0], plan
 plan.reduce [position].to_set do |delivered, direction|
    # this line is just for fun, it's not worth it for arrays of length 2
    position = position.zip(direction).map { |coordinates| coordinates.reduce(&:+) }

    delivered << position
  end
end

def delivering plan
  puts "#{(deliver plan).length}"
end

Input.open 3 do |input|
  parse(input).tap { |plan| delivering plan }
end