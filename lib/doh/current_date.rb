require 'doh/core_ext/datewithtime'

module Doh

@@current_date_objs = []

def self.current_date(dflt = Date.utcday)
  return dflt if @@current_date_objs.empty?
  @@current_date_objs.last.to_date
end

def self.current_datetime(dflt = DateTime.utcnow)
  return dflt if @@current_date_objs.empty?
  cdo = @@current_date_objs.last
  return cdo if cdo.respond_to?(:hour)
  DateTime.new(cdo.year, cdo.month, cdo.day, dflt.hour, dflt.min, dflt.sec, dflt.zone)
end

def self.push_current_date(date_obj)
  @@current_date_objs.push(date_obj)
end

def self.pop_current_date
  @@current_date_objs.pop
end

def self.clear_current_date
  @@current_date_objs.clear
end

def self.date_as(date_obj, &block)
  push_current_date(date_obj)
  begin
    retval = block.call
  rescue
    raise
  ensure
    pop_current_date
  end
  retval
end

end
