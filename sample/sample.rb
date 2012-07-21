#!/usr/bin/env ruby
require 'doh/app/origin'
require 'sample_library_file'

OPTS = Doh::Options.new(
 { 'arg1' => ['defaultvalue', '-a', '--arg1 <value>', 'you can pass argument 1 here, if not passed it defaults to defaultvalue'], \
   'arg2' => ['defaultvalue2', '-b', '--arg2 <value>', 'you can pass argument 2 here, if not passed it defaults to defaultvalue2'], \
 }, true, 'this application is just an example application, the final boolean specifies that it has a variable number of arguments passed to it (filenames is the common use case)')

puts "argument1 is: #{OPTS.arg1}"
puts "argument2 is: #{OPTS.arg2}"

puts "varargs: #{OPTS.varargs}"
