module AppNexus
  module Handlers
    class AppResponse < OpenAPI::Handler
      class << self
        def method_missing(method_symbol, *arguments) #:nodoc:
          method_name = method_symbol.to_s
          if method_name =~ /^(\w+)_model$/
            return self.send :const_model, $1, false, *arguments
          elsif method_name =~ /^(\w+)_models$/
            return self.send :const_model, $1, true, *arguments
          else
            super
          end
        end

        private

        def const_model(snake_name, is_array, response, options)
          return self.failed(response) if not response.success?
          klass_name = snake_name.classify
          hash = JSON.parse(response.raw)["response"]
          if hash.has_key?("error_id")
            klass_name = "Error"
          end
          resp = AppNexus::Models::Response.new(hash)
          klass = AppNexus::Models.const_get(klass_name)
          if is_array
            results = []
            (resp.send "#{snake_name}s".to_sym).each do |h|
              results << klass.new(h)
            end
            resp.send "#{snake_name}s=".to_sym, results
          else
            resp.send "#{snake_name}=".to_sym, klass.new(resp.send snake_name.to_sym)
          end
          return OpenAPI::Handlers::Response.wrap(resp, response)
        end

        def hashie(response, options)
          return self.failed(response) if not response.success?
          hash = JSON.parse(response.raw)["response"]
          if hash.has_key?("error_id")
            resp = AppNexus::Models::Error.new(hash)
          else
            resp = AppNexus::Models::Response.new(hash)
          end
          return OpenAPI::Handlers::Response.wrap(resp, response)
        end

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
