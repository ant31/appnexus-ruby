module AppNexus
  module Handlers
    class AppResponse < OpenAPI::Handler
      class << self
        def method_missing(method_symbol, *arguments) #:nodoc:
          method_name = method_symbol.to_s
          if method_name =~ /^(\w+)_model$/
            return self.send :construct_model, $1, *arguments
          else
            super
          end
        end

        private

        def construct_model(snake_name, response, options)
          return self.failed(response) if not response.success?
          klass_name = snake_name.classify
          hash = JSON.parse(response.raw)["response"]
          if hash.has_key?("error_id")
            klass_name = "Error"
          end
          klass = AppNexus::Models.const_get(klass_name)
          model = klass.new(hash)
          model = OpenAPI::Handlers::Response.wrap(model, response)
          return model
        end
      end
    end
  end
end
