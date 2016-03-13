require_relative 'input'

def has_at_least pattern, times
  -> string { string.scan(pattern).length >= times }
end

def contains pattern
  -> string { pattern =~ string }
end

def excludes pattern
  -> string { not contains(pattern).call(string) }
end

#part1
def has_three_vowels() has_at_least %r{[aeiou]}, 3 end
def contains_twice_in_row() contains %r{(\w)\1} end
def excludes_forbidden_strings() excludes %r{(?:ab|cd|pq|xy)} end

def is_nice? string
  has_three_vowels.call(string) \
    && contains_twice_in_row.call(string) \
    && excludes_forbidden_strings.call(string)
end

Input.open 5 do |input|
  p input.select { |string| is_nice? string }.length
end