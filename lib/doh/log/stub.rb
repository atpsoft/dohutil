class Object
  unless respond_to?(:dohlog)
    class DohlogStubInterface
      def self.debug(msg); end
      def self.info(msg); end
      def self.alert(msg); end
      def self.error(msg, exception = nil); end
      def self.fatal(msg, exception = nil); end
    end
    def dohlog
      DohlogStubInterface
    end
  end
end
