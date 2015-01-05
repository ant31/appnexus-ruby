module AppNexus
  class AuthToken < OpenAPI::AuthToken

    def self.key
      "#{self.name}::#{AppNexus.user}"
    end

    def initialize(opts={}, save=false)
      opts = {"token" => nil,
        "expires_in" => 3600,
        "key" => self.class.key,
        "header_format" => "%s"}.merge(opts)
      super opts, save
    end

    def new_auth_token()
      auth = AppNexus::Models::Auth.new(username: AppNexus.user, password: AppNexus.password)
      auth_response = AppNexus::Client.auth(auth)
      if auth_response.success? && !auth_response.error?
        update({"token" => auth_response.token,
                 "expires_in" => 3600})
      else
        #@TODO real exception
        raise Exception("Bad Auth")
      end
    end
  end
end