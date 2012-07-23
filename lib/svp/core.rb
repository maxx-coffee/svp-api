
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

      def get_video(ref_no)
        response = get('svp_list_videos', :query => {:ref_no => ref_no})
        video_list =  response['response']['video_list']['video']
        #result = video_list.select {|f| f["ref_no"] == ref_no }
        return video_list
      end

  	  def get_image(ref_no)
  	  	resp = get('svp_get_primary_video_image', :query => {:video_ref => ref_no})
        return resp

  	  end

      def get_embed(ref_no)
        resp = get('svp_get_player_code', :query => {:video_ref => ref_no ,:template_ref => "7723"})
        return resp
      end

      def get_video(ref_no)
        resp = get('svp_get_player_code', :query => {:video_ref => ref_no , :param_overrides => {:width = "947"} })
        return resp
      end

      def create_broadcast
        resp = get('svp_broadcast_feed')
        return resp
      end

      def start_broadcast(ref_no)
        resp = get('svp_start_broadcast', :query => {:video_ref => ref_no})
        return resp

      end

      def stop_broadcast(ref_no)
        resp = get('svp_stop_broadcast', :query => {:video_ref => ref_no})
        return resp
      end

      def delete_video(ref_no)
        resp = get('svp_delete_video', :query => {:video_ref => ref_no})
        return resp
      end

      def get_stream(ref_no)
        resp = get('svp_list_videos', :query => {:start_ref_no => ref_no, :end_ref_no =>ref_no})
        return resp['response']['video_list']['video']['stream_name']
      end


      def start_record(ref_no)
        resp = get('svp_start_recording', :query => {:video_ref => ref_no})
        return resp
      end

      def stop_record(ref_no)
        resp = get('svp_stop_recording', :query => {:video_ref => ref_no})
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


