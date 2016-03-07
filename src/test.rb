require 'benchmark'

a = [0, 1]
b = [3, 4]

Benchmark.bm do |x|
  x.report("normal     ") { [a[0] + b[0], a[1] + b[1]] }
  x.report("complicated") { a.zip(b).map { |ar| ar.reduce(:+) } }
end