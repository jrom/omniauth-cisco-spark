require 'spec_helper'

describe OmniAuth::Strategies::CiscoSpark do

  subject do
    OmniAuth::Strategies::CiscoSpark.new({})
  end

  context 'client options' do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.ciscospark.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/v1/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/v1/access_token')
    end
  end

  context 'populating data' do

    before(:each) do
      example_user = {
        'displayName' => 'Jordi',
        'avatar' => 'https://c74213ddaf67eb02dabb-04de5163e3f90393a9f7bb6f7f0967f1.ssl.cf1.rackcdn.com/V1~3af133bf430b4b70c155b5d38f6b58c5~NTxkwW_4SfqyzspWJ6-0dw==~1600',
        'emails' => ['jordi@jrom.net'],
        'id' => 'abcd1234'
      }
      allow(subject).to receive(:raw_info) { example_user }
    end

    context 'user id' do
      it 'should populate id' do
        expect(subject.uid).to eq('abcd1234')
      end
    end

    context 'user info' do

      it 'should populate nickname' do
        expect(subject.info[:nickname]).to eq('Jordi')
      end

      it 'should populate nickname' do
        expect(subject.info[:emails]).to eq(['jordi@jrom.net'])
      end

      it 'should populate avatar' do
        expect(subject.info[:avatar]).to eq('https://c74213ddaf67eb02dabb-04de5163e3f90393a9f7bb6f7f0967f1.ssl.cf1.rackcdn.com/V1~3af133bf430b4b70c155b5d38f6b58c5~NTxkwW_4SfqyzspWJ6-0dw==~1600')
      end

      it 'should populate id' do
        expect(subject.info[:id]).to eq('abcd1234')
      end
    end
  end
end
