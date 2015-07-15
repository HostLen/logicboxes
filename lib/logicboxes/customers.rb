module Logicboxes
  class Customers
    def self.generate_token(username, password, ip)
      a = Logicboxes::LogicboxesConnector.send('/api/customers/generate-token.json', {username: username, passwd: password, ip: ip}, :get)
      return eval(a)
    end

    def self.authenticate_token(token)
      return token
    end
  end
end
