#!/usr/bin/env ruby


GC::Profiler.enable

(1..300_000).inject(:*)

# puts GC::Profiler.report
puts GC::Profiler.total_time

GC::Profiler.clear
GC::Profiler.disable

GC::Profiler.enable

300_000_000.times{1+1}

puts GC::Profiler.total_time
GC::Profiler.disable
