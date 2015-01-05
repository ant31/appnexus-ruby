$:.unshift(File.dirname(__FILE__))
module AppNexus
  module Models
    autoload :Auth, "models/auth"
    autoload :AuthResponse, "models/auth_response"
    autoload :Error, "models/error"
    autoload :Report, "models/report"
    class AppNexusBase < OpenAPI::Models::Base
      def error?
        self.is_a?(AppNexus::Models::Error)
      end
    end
  end
end
