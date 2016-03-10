require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class CiscoSpark < OmniAuth::Strategies::OAuth2
      option :name, 'cisco_spark'

      option :client_options, {
        site: 'https://api.ciscospark.com',
        authorize_url: '/v1/authorize',
        token_url: '/v1/access_token'
      }

      uid { raw_info['id'] }

      info do
        hash = {
          nickname: raw_info['displayName'],
          avatar: raw_info['avatar'],
          emails: raw_info['emails'],
          id: raw_info['id']
        }

        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/people/me').parsed
      end

    end
  end
end
