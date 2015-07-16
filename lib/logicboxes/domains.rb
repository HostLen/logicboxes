require 'logicboxes'
require 'json'
module Logicboxes
  class Domains
    def search(args)
      args['no-of-records'] = 500
      args['page-no'] = 1
      a = Logicboxes::LogicboxesConnector.send('/api/domains/search.json', args, :get)
      Json.parse(a)
    end
  end
end