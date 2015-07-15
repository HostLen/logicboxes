require 'logicboxes/version'
require 'logicboxes/configuration'
require 'logicboxes/customers'
require 'uri'
require 'net/http'

module Logicboxes
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

  class LogicboxesConnector
    def self.send(path, args, method = :get)
      baseuri = URI('https://httpapi.com')
      baseuri.path = path
      args['auth-userid'] = Logicboxes.configuration.auth_userid
      args['api-key'] = Logicboxes.configuration.api_key
      case method
        when :get
          baseuri.query = URI.encode_www_form args
          s = Net::HTTP.get(baseuri)
        when :post
          s = Net::HTTP.post_form(baseuri, args)
        else
          raise Exception('HTTP Method not supported')
      end
      s
    end
  end
end
