require 'benchmark/ips'
require 'date'

Benchmark.ips do |x|
  x.report('Time#now') { Time.now }
  x.report('DateTime#now') { DateTime.now }
  x.compare!
end