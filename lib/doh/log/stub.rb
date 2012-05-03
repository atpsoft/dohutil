module DohLog
  class StubInterface
    def self.debug(msg); end
    def self.info(msg); end
    def self.notify(msg); end
    def self.warn(msg); end
    def self.error(msg, exception = nil); end
    def self.fatal(msg, exception = nil); end
  end
end

class Module
  unless method_defined?(:dohlog)
    def dohlog
      DohLog::StubInterface
    end
  end
end

class Object
  unless method_defined?(:dohlog)
    def dohlog
      DohLog::StubInterface
    end
  end
end
