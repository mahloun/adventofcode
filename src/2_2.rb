require_relative "input"

def parse input
  input.map { |gift| gift.split('x').map(&:to_i) }
end

add_reducer = -> fn {
  -> collection { collection.reduce(0) { |acc, item| acc += fn.call item } }
}

smallest_perimeter = add_reducer.call -> side { side * 2 }
ribbon = -> gift { gift.reduce(&:*) + smallest_perimeter.call(gift.min 2) }
ribbon_all = add_reducer.call -> gift { ribbon.call gift }

Input.open 2 do |input|
  parse(input).tap { |gifts|
    p ribbon_all.call gifts
  }
end