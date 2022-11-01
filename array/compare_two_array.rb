require 'benchmark/ips'
require 'set'

ARRAY = [*1..10]
OTHER = ARRAY.reverse

def fast
  (ARRAY - OTHER).empty? && (OTHER - ARRAY).empty?
end

def slow
  ARRAY.to_set == OTHER.to_set
end

Benchmark.ips do |x|
  x.report('Array相减') { fast }
  x.report('Array#to_set') { slow }
  x.compare!
end

# Array#to_set: 6.90x slower