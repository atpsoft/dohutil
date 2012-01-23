require 'ostruct'
require 'optparse'

module Doh

class Options
  # this class is for command line parsing
  # the hash is of the form: {'variable_name' => option_list}
  # you can also pass an array of hashes [{'var1' => optlist1}, {'var2' => optlist2}]
  # if you use an array of hashes, the help will be shown in the order specified (otherwise it's random)

  # option_list is an array, the first element of which is the default value of the option
  # the others are of the form with examples shown on
  # http://www.ruby-doc.org/stdlib/libdoc/optparse/rdoc/index.html
  # returns any non-options parameters via method varargs
  # set allow_unknown_options to true to allow for filename specification, etc..
  # if the default value is :required for a field, then if that field isn't
  # specified, an exception will be raised
  def initialize(param_definition_hash_or_array, allow_unknown_options = false, explanation_text = '', unknown_options_name = 'file', allow_no_prefix = false)
    @vals = OpenStruct.new

    @opts = OptionParser.new
    @opts.banner = "Usage: #{$0} [options]"
    if explanation_text != ''
      @opts.separator ""
      @opts.separator explanation_text
    end
    @opts.separator ""
    @opts.separator "Specific options:"
    @opts.separator ""

    if param_definition_hash_or_array.class == Array
      param_definition_array = param_definition_hash_or_array
      param_definition_hash = param_definition_hash_or_array.inject({}) {|sum, elem| sum.merge(elem)}
    else
      param_definition_array = param_definition_hash_or_array.collect {|elem1, elem2| {elem1 => elem2}}
      param_definition_hash = param_definition_hash_or_array
    end

    param_definition_array.each do |elem|
      keyname = elem.to_a[0][1][2]
      if keyname =~ /^--no-/
        raise "key name: #{keyname} will not behave as desired if meant to be a boolean, rename it, or pass in allow_no_prefix flag as 5th param"
      end
    end

    param_definition_array.each do |elem|
      key = elem.to_a[0][0]
      val = elem.to_a[0][1]
      default = val.shift
      @vals.send("#{key}=", default)
      val.last.insert(0, '(required) - ') if val.last.is_a?(String) && default == :required
      @opts.on(*val) do |optval|
        @vals.send("#{key}=", optval)
      end
    end

    @opts.separator ""
    @opts.separator "Common options:"
    @opts.separator ""

    @opts.on("-h", "-?", "--help", "Show this message") do
      puts @opts
      exit
    end

    varargs = []
    @opts.order(ARGV) do |arg|
      varargs.push(arg)
    end
    @vals.varargs = varargs

    unset_vars = []
    param_definition_hash.each do |key,val|
      if @vals.send(key) == :required
        unset_vars.push(key)
      end
    end

    exception = ''
    exception << "Required options not specified: #{unset_vars.inspect}\n" unless unset_vars.size == 0
    exception << "Unknown options specified: #{varargs.inspect}\n" unless allow_unknown_options || (varargs.size == 0)
    exception << "You must specify #{allow_unknown_options} #{unknown_options_name}#{allow_unknown_options > 1 ? 's' : ''}" if allow_unknown_options.class == Fixnum && varargs.size != allow_unknown_options
    if allow_unknown_options.class == Range
      if (allow_unknown_options.min == allow_unknown_options.max)
        if (varargs.size < allow_unknown_options.min)
          exception << "You must specify at least #{allow_unknown_options.min} #{unknown_options_name}#{allow_unknown_options.min > 1 ? 's' : ''}"
        end
      elsif !allow_unknown_options.include?(varargs.size)
        exception << "You must specify between #{allow_unknown_options.min} and #{allow_unknown_options.max} #{unknown_options_name}s"
      end
    end
    if exception != ''
      puts @opts
      raise exception
    end
  end

  def method_missing(sym, *args)
    @vals.send(sym, *args)
  end

  def to_s
    @opts.to_s
  end
end

end
