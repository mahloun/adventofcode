require_relative "input"

def basement_meet index
  p index
end

def count_floor
  met_basement = false

  lambda { |acc, (floor, index)|

  met_basement = basement_meet index if !met_basement && acc == -1

    acc += floor == '(' ? 1 : -1
  }
end

Input.open 1 do |instructions|
  instructions.each_with_index.reduce(0, &count_floor)
end