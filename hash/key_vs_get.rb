require 'benchmark/ips'
require 'set'

HASH = { a: 1 }

def slow
  HASH.key?(:a)
end

def fast
  HASH[:a]
end

Benchmark.ips do |x|
  x.report('key?') { slow }
  x.report('get') { fast }
  x.compare!
end

# Array#key?: 1.04x slower
