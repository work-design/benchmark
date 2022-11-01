require 'benchmark/ips'

def slow
  h = [1, nil]
  h = h.compact
end

def fast
  h = [1, nil]
  h.compact!
  h
end

Benchmark.ips do |x|
  x.report('Array#compact') { slow }
  x.report('Array#compact!') { fast }
  x.compare!
end

# Array#compact: 1.16x slower