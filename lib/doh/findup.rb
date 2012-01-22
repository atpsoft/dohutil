module Doh
  def self.findup(start_directory, filename, max_tries = 20)
    curr_directory = start_directory
    max_tries.times do
      path = File.expand_path(File.join(curr_directory, filename))
      return path if File.exist?(path)
      return nil if (path == '/')
      curr_directory = File.join(curr_directory, '..')
    end
    nil
  end
end
