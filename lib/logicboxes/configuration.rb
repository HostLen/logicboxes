module Logicboxes
  class Configuration
    attr_accessor :api_key
    attr_accessor :auth_userid

    def initialize
      @api_key = nil
      @auth_userid = nil
    end
  end
end