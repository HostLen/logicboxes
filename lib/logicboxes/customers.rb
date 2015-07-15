require 'json'
require 'logicboxes'
module Logicboxes
  class Customers
    def self.generate_token(username, password, ip)
      a = Logicboxes::LogicboxesConnector.send('/api/customers/generate-token.json', {username: username, passwd: password, ip: ip}, :get)
      return eval(a)
    end

    def self.authenticate_token(token)
      a = Logicboxes::LogicboxesConnector.send('/api/customers/authenticate-token.json', {token: token}, :get)
      return JSON.parse(a)
    end
  end
end
