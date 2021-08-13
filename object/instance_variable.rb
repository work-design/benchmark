require 'benchmark/ips'

@a = 1

def fast
  @a
end

def slow
  instance_variable_get :@a
end

Benchmark.ips do |x|
  x.report('直接调用') { fast }
  x.report('instance_variable_get') { slow }
  x.compare!
end