require 'parallel'
require 'digest'

class Fixnum
  def chunks parts
    chunk_size = self / parts

    [[0, chunk_size]].tap { |chunk|
      1.upto(parts - 1) { |i| chunk << [chunk[i - 1][1] + 1, chunk_size + chunk_size * i] }
      chunk.last[1] += self % parts
    }
  end

  def range_chunks parts
    (chunks parts).map { |chunk| (chunk[0]..chunk[1]) }
  end
end

def digest msg
  Digest::MD5.hexdigest msg
end

def match? digest
  digest.start_with? "000000"
end

def zeroes_start_digest range
  range.each do |number|
    return number if match? digest "yzbqklnj#{number}"
  end

  Float::INFINITY
end

def threaded_zeroes_start_digest(range:, threads:)
  [].tap { |range_res|
    Parallel.each(range.range_chunks(threads), in_threads: threads) { |range|
      range_res << zeroes_start_digest(range)
    }
  }.min
end

p threaded_zeroes_start_digest(range: 10000000, threads: 5)