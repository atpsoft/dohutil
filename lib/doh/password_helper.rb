require 'highline'

#thin wrapper around HighLine, in case we decide to use something else in the future

module Doh
class PasswordHelper
  @highline = HighLine.new

  def self.prompt_password(prompt = "Password: ")
    @highline.ask(prompt) {|q| q.echo = false}
  end

end
end
