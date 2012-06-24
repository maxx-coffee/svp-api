require 'rubygems'
module Svp
class Core
      include HTTParty
  	  base_uri 'http://www.streamingvideoprovider.com/?l=api&a='

  	  def initialize(api_code,api_key)
  	  	@default_query_opts = { :api_key => api_key, :api_code => api_code}
  	  end

  	  def get_auth_token
  	  	response = get('svp_auth_get_token')
        return response
  	  end

  	  def get(method, opts={})
        opts[:query] ||= {}
        opts[:query].merge!(@default_query_opts)
        response = self.class.get(method, opts)
        return response
      end
end
end
