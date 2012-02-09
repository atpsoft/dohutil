require 'net/http'
require 'net/https'
require 'uri'

module Doh

class HttpHelper
  attr_reader :headers

  def initialize(url)
    @url = url
    @headers = {}
    init_sender
  end

  def post(data, get_body_only = true)
    dohlog.debug("posting to url #@url data: #{data.inspect}")
    response = if data.is_a?(Hash)
      post_hash(data)
    else
      post_string(data)
    end
    check_for_errors(response)
    return response.body.to_s if get_body_only
    response
  end

  def get(get_body_only = true, allow_redirect = false, num_redirects = 0)
    getstr = @parsed_url.path
    getstr += '?' + @parsed_url.query unless @parsed_url.query.to_s.empty?
    request = Net::HTTP::Get.new(getstr)
    request.initialize_http_header(@headers)
    response = @sender.start { |http| http.request(request) }
    if response.is_a?(Net::HTTPRedirection) && allow_redirect
      raise "too many redirects" if num_redirects > 20
      @url = response['location']
      init_sender
      return get(get_body_only, true, num_redirects + 1)
    end
    return response.body.to_s if get_body_only
    response
  end

  def xml
    @headers['Content-Type'] = 'text/xml'
    self
  end

  def soap_action(action)
    @headers['SOAPAction'] = action
    self
  end

  def nossl
    @sender.use_ssl = false
    @nossl = true
    self
  end

  def timeout(seconds)
    @sender.read_timeout = seconds
    self
  end

  def hdr(name, value)
    @headers[name] = value
    self
  end

  #shortcut method
  def self.load(url, use_ssl = true, encode_url = false)
    url = URI.escape(url) if encode_url
    helper = HttpHelper.new(url)
    helper.nossl if !use_ssl
    helper.get
  end
private
  def init_sender
    @parsed_url = URI.parse(@url)
    @sender = Net::HTTP.new(@parsed_url.host, @parsed_url.port)
    @sender.use_ssl = true unless @nossl || (['127.0.0.1', 'localhost'].include?(@parsed_url.host) && @parsed_url.port != 443)
    @sender.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def post_hash(data)
    request = Net::HTTP::Post.new(@parsed_url.path)
    request.set_form_data(data)
    request.initialize_http_header(@headers)
    @sender.start { |http| http.request(request) }
  end

  def post_string(data)
    @sender.post(@parsed_url.path, data, @headers)
  end

  def check_for_errors(response)
    # TODO: do something useful here
#     case response
#     when Net::HTTPSuccess
#       puts "success"
#       puts response.body.to_s
#     else
#       puts response.error!
#     end
  end
end

end
