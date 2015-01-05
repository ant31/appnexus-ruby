require 'json'
require 'net/https'
require 'time'
require 'base64'

#require File.join(File.dirname(__FILE__), '../../response')
module AppNexus
  module ClassMethods
    include OpenAPI::ClassMethods
    attr_accessor :user, :password

    def build_path(path, params=nil)
      uri = URI("/#{path}")
      if params != nil
        uri.query = URI.encode_www_form(params)
      end
      return uri
    end

    def site
      @site ||= "api.appnexus.com"
    end

    def auth_token
      @auth_token ||= AppNexus::AuthToken.new
    end
  end

  class << self
    include ClassMethods
  end

  class Client
    include ClassMethods

    class << self
      include ClassMethods
    end

    def initialize(options={})
      @logger = options[:logger] || AppNexus.logger
      @user = options[:user] || AppNexus.user
      @application_secret = options[:password] || AppNexus.password
      @site = options[:site] || AppNexus::Client.site
      @request_timeout = options[:request_timeout] || AppNexus::Client.request_timeout || 5
      @max_retry = options[:max_retry] || AppNexus::Client.max_retry ||  2
      AppNexus::Routes.generate(self)
      # init handlers
    end
  end
end
