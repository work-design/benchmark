require 'benchmark/ips'

def fast
  Object
end

def slow
  Object.const_get 'Object'
end

Benchmark.ips do |x|
  x.report('直接调用') { fast }
  x.report('const get 调用') { slow }
  x.compare!
end
