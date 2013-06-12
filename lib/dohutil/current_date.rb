require 'dohutil/core_ext/datewithtime'

module Doh
extend self
@current_date_stack = []

def current_date(dflt = Date.today)
  return dflt if @current_date_stack.empty?
  @current_date_stack.last.to_date
end

def current_datetime(dflt = DateTime.now)
  return dflt if @current_date_stack.empty?
  cdo = @current_date_stack.last
  return cdo if cdo.respond_to?(:hour)
  DateTime.new(cdo.year, cdo.month, cdo.day, dflt.hour, dflt.min, dflt.sec, dflt.zone)
end

def push_current_date(date_obj)
  @current_date_stack.push(date_obj)
end

def pop_current_date
  @current_date_stack.pop
end

def clear_current_date
  @current_date_stack.clear
end

def date_as(date_obj)
  push_current_date(date_obj)
  begin
    retval = yield
  ensure
    pop_current_date
  end
  retval
end

end
