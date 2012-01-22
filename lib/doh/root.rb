require 'doh/findup'

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
    rootfile = Doh::findup(start_directory, filename, max_tries)
    if rootfile
      Doh::root = File.dirname(rootfile)
    end
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
