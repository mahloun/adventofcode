require 'digest'

def digest msg
  Digest::MD5.hexdigest msg
end

def match? digest
  digest.start_with? "00000"
end

def zeroes_start_digest range
  range.each { |number|
    return number if match? digest "yzbqklnj#{number}"
  }
end

p zeroes_start_digest (1..Float::INFINITY)