module AppNexus
  module Models

    class Auth < AppNexus::Models::Base
      include Virtus.model
      attribute :username, String
      attribute :password, String
    end
  end
end
