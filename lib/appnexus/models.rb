$:.unshift(File.dirname(__FILE__))
module AppNexus
  module Models
    autoload :Auth, "models/auth"
    autoload :AuthResponse, "models/auth_response"
    autoload :Error, "models/error"
    autoload :Report, "models/report"
    autoload :Response, "models/response"
    autoload :DbgInfo, "models/dbg_info"
    autoload :Advertiser, "models/advertiser"
    autoload :Segment, "models/segment"
    class AppNexusBase < OpenAPI::Models::Base
      one :dbg_info, :class_name => AppNexus::Models::DbgInfo
      define_attributes :count, :start_elements, :num_elements, :status

      def error?
        self.is_a?(AppNexus::Models::Error)
      end

    end
  end
end
