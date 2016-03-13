module Input
  def self.open nb, &block
    File.open(File.join('input', "#{nb}_day"), 'r') do |file|
      file.read.split("\n").tap(&block)
    end
  end
end