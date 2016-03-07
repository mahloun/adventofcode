require_relative "input"

def parse input
  input.map { |gift| gift.split('x').map(&:to_i) }
end

add_reducer = -> fn {
  -> collection { collection.reduce(0) { |acc, item| acc += fn.call item } }
}

def sides gift, acc = []
  dimensions = -> a, b { a * b * 2 }

  return acc if acc.length == 3

  sides [gift[1], gift[2], gift[0]], acc << dimensions.call(gift[0], gift[1])
end

wrap = -> gift { gift.reduce(&:+) + gift.min / 2 }
wrap_all = add_reducer.call -> gift { wrap.call sides gift }

Input.open 2 do |input|
  parse(input).tap { |gifts|
    p wrap_all.call gifts
  }
end