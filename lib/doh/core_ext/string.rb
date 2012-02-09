class String
  def firstn(limit)
    return nil if limit < 0
    return '' if limit == 0
    slice(Range.new(0, limit -1))
  end

  def lastn(limit)
    return nil if limit < 0
    return '' if limit == 0
    slice(Range.new(-limit, -1)) || self
  end

  def mid(first, count = nil)
    slice(first, count || (size - first))
  end

  def after(substr)
    loc = index(substr)
    return nil if loc.nil?
    mid(loc + substr.size)
  end

  def rafter(substr)
    loc = rindex(substr)
    return nil if loc.nil?
    mid(loc + substr.size)
  end

  def before(substr)
    loc = index(substr)
    return nil if loc.nil?
    firstn(loc)
  end

  def rbefore(substr)
    loc = rindex(substr)
    return nil if loc.nil?
    firstn(loc)
  end
end
