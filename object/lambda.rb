require 'benchmark/ips'

PARTS = [:years, :months, :weeks, :days, :hours, :minutes, :seconds].freeze
HASH = {
  days: 1,
  weeks: 2,
  hours: 3
}

def proc_test
  HASH.sort_by { |unit,  _| PARTS.index(unit) }
end

def lambda_test
  HASH.sort_by(&->(unit){ PARTS.index(unit[0]) })
end

Benchmark.ips do |x|
  x.report('lambda') { lambda_test }
  x.report('proc') { proc_test }
  x.compare!
end

# lambda:  1282910.6 i/s - 1.22x  (± 0.00) slower
