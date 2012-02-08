class Dir
  def self.directories(path, include_dots = false)
    entries(path).find_all do |entry|
      File.directory?(File.join(path, entry)) && (include_dots || entry[0,1] != '.')
    end
  end
end
