require 'spec_helper'
require 'json'

describe Logicboxes do
  it 'has a version number' do
    expect(Logicboxes::VERSION).not_to be nil
  end

  it 'can send requests to LogicBoxes' do
    Logicboxes.configure do |config|
      config.api_key = 'hzwGF95aCg1vy9LWq1bg52wr7wlsllHW'
      config.auth_userid = '606230'
    end

    res = Logicboxes::LogicboxesConnector.send('/api/domains/available.json', {'domain-name': 'sarunint', tlds: ['com']})

    a = JSON.parse(res)
    expect(a['sarunint.com']).not_to be nil
  end
end
