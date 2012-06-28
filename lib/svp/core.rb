
require 'rubygems'
require 'open-uri'

module Svp
class Core
      include HTTParty
  	  base_uri 'http://www.streamingvideoprovider.com/?l=api&a='

  	  def initialize(api_code,api_key)
  	  	response = get_token('svp_auth_get_token', :query => { :api_key => api_key, :api_code => api_code})
        @default_query_opts = { :token => response['response']['auth_token']}
  	  end

  	  def get_auth_token
  	  	response = get('svp_auth_get_token', :query => { :api_key => @api_code, :api_code => @api_key})
        return response['response']['auth_token']
  	  end

  	  def list_videos
  	  	response = get('svp_list_videos')
  	  	return response['response']['video_list']
  	  end	

  	  def get_image(ref_no)
  	  	resp = get('svp_get_primary_video_image', :query => {:video_ref => ref_no})
        return resp

  	  end

      def get_embed(ref_no)
        resp = get('svp_get_player_code', :query => {:video_ref => ref_no, :embed_type => "object" })
        return resp
      end

      


  	  def get(method, opts={})
  	  
        opts[:query] ||= {}
        opts[:query].merge!(@default_query_opts)
        response = self.class.get(method, opts)
        return response
      end

      def get_token(method, opts={})
  	  
        opts[:query] ||= {}
        response = self.class.get(method, opts)
        return response
      end

end
end


