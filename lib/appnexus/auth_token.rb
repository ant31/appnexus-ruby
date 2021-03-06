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
      auth_response = AppNexus::Client.auth(body: {auth: auth}.to_json(root: false))
      if auth_response.success? && !auth_response.error?
        update({"token" => auth_response.token,
                 "expires_in" => 3600})
      else
        if auth_response.error?
          msg = auth_response.to_json
        else
          msg = "Unknown"
        end
        raise OpenAPI::Exceptions::AuthError, msg
      end
    end
  end
end
