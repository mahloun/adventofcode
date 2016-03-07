require_relative "input"

def count_floor
  lambda { |acc, floor|
    acc += floor == '(' ? 1 : -1
  }
end

Input.open 1 do |instructions|
  p instructions.reduce(0, &count_floor)
end