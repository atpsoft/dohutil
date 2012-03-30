require 'doh/core_ext/datewithtime'

module Doh

@current_date_stack = []

def self.current_date(dflt = Date.today)
  return dflt if @current_date_stack.empty?
  @current_date_stack.last.to_date
end

def self.current_datetime(dflt = DateTime.zow)
  return dflt if @current_date_stack.empty?
  cdo = @current_date_stack.last
  return cdo if cdo.respond_to?(:hour)
  DateTime.new(cdo.year, cdo.month, cdo.day, dflt.hour, dflt.min, dflt.sec, dflt.zone)
end

def self.push_current_date(date_obj)
  @current_date_stack.push(date_obj)
end

def self.pop_current_date
  @current_date_stack.pop
end

def self.clear_current_date
  @current_date_stack.clear
end

def self.date_as(date_obj)
  push_current_date(date_obj)
  begin
    retval = yield
  ensure
    pop_current_date
  end
  retval
end

end
