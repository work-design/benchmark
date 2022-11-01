require 'benchmark/ips'

def fast
  1.to_s
end

def slow
  1.send :to_s
end

Benchmark.ips do |x|
  x.report('直接调用') { fast }
  x.report('send 调用') { slow }
  x.compare!
end

# send 调用: 1.23x slower