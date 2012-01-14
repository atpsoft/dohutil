module Doh
  def self.root
    @root
  end

  def self.root=(directory)
    @root = directory
    # having a root lib/ directory in your gem or application tree is a common standard now
    $LOAD_PATH.push(File.join(@root, 'lib'))
  end

  def self.find_root(start_directory, filename = 'dohroot', max_tries = 20)
    curr_directory = start_directory
    max_tries.times do
      path = File.join(curr_directory, filename)
      if File.exist?(path)
        Doh::root = curr_directory
        return curr_directory
      end
      return false if (path == '/')
      curr_directory = File.expand_path(File.join(curr_directory, '..'))
    end
    false
  end

  def self.find_root_from_file(filepath)
    Doh::find_root(File.dirname(filepath))
  end

  def self.find_root_from_path(path)
    if File.directory?(path)
      Doh::find_root(path)
    else
      Doh::find_root(File.dirname(path))
    end
  end

  def self.find_root_from_bin
    Doh::find_root(File.dirname($PROGRAM_NAME))
  end

  def self.find_root_from_pwd
    Doh::find_root(Dir.pwd)
  end
end
