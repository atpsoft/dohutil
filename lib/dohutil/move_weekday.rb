require 'dohutil/core_ext/date'

class Date
  def next_weekday
    retval = self + 1
    until retval.weekday?
      retval += 1
    end
    retval
  end

  def previous_weekday
    retval = self - 1
    until retval.weekday?
      retval -= 1
    end
    retval
  end
end
