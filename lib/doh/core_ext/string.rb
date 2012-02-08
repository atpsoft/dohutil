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
end
