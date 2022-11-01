require 'benchmark/ips'

module Aaa
  module Bbb

  end
end

def fast
  Aaa::Bbb
end

def slow
  Aaa.const_get 'Bbb'
end

Benchmark.ips do |x|
  x.report('直接调用') { fast }
  x.report('const get 调用') { slow }
  x.compare!
end

# const get 调用: 2.56x slower
