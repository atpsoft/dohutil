class Hash
  def to_h
    self
  end

  def setnew(key, value)
    store(key, value) unless key?(key)
  end

  def merge_with_remove(hash)
    self.dup.merge_with_remove!(hash)
  end

  #merges the given hash with the current
  #then removes any elements from the merged hash that have
  #a value of nil in the hash argument
  def merge_with_remove!(hash)
    self.merge!(hash).reject! {|elem, value| hash.key?(elem) && hash[elem].nil?}
    self
  end
end
