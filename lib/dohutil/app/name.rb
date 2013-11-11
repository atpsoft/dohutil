module DohApp
extend self

def name
  @name ||= File.basename($PROGRAM_NAME, '.rb')
end

def name=(appname)
  @name = appname
end

end
