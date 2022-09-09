# Place any route or template helper funcs below...

module SearchEngine
  module Helpers
    def benchmark(&block)
      measurements = Benchmark.measure &block
      measurements.real&.round(2) || 0.0
    end
  end
end
