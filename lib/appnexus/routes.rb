module AppNexus
  module Params
    class << self
      def pagination()
        return {:page => Integer, :pageSize => Integer}
      end

      def sorting()
        {:sortBy => String, :sortDirection => String}
      end
      def date()
        return {:dateFrom => OpenAPI::Utils::Date, :dateTo =>  OpenAPI::Utils::Date}
      end

      def filter()
        return {:filter => String}
      end

      def visible()
        return {:visible => String}
      end

      def status()
        return {:status => String}
      end

      def create(*args)
        res = {}
        args.each do |a|
          res = res.merge(a)
        end
        return res
      end
    end
  end

  module Routes
    class << self
      P = AppNexus::Params
      def generate(client=AppNexus::Client)
        OpenAPI::Route.draw(client) do
          ## AUTH
          match "auth", "app_nexus/handlers/app_response#auth_response_model", :auth, via: :post, :body => AppNexus::Models::Auth, :to_json => {root: true}, :extra => {:skip_auth => true}
          ## Reports
          match "report", "app_nexus/handlers/app_response#report_model", :report, via: :get, :params => {:advertiser_id => Integer}
        end
      end
    end
  end
end
