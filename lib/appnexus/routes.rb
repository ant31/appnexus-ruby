module AppNexus
  module Params
    class << self
      def pagination()
        {:start_element => Integer, :num_elements => Integer}
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
          match "report", "app_nexus/handlers/app_response#report_model", :getReports, via: :get, :params => P.create(P.pagination, {:advertiser_id => Integer})
          ## Advertisers
          match "advertiser", "app_nexus/handlers/app_response#response_model", :getAdvertisers, via: :get, :params => P.create(P.pagination)
          match "advertiser", "app_nexus/handlers/app_response#response_model", :getAdvertiser, via: :get, :params => {:id => Integer}
          # Segements
          match "segment", "app_nexus/handlers/app_response#response_model", :getSegments, via: :get, :params => P.create(P.pagination)
          match "segment", "app_nexus/handlers/app_response#response_model", :getSegment, via: :get, :params => {:id => Integer}
          # CRUD CALLS
          match "GET", "app_nexus/handlers/app_response#response_model", :GET, via: :get, :params => P.create(P.pagination)
          match "DELETE", "app_nexus/handlers/app_response#response_model", :DELETE, via: :get
          match "PUT", "app_nexus/handlers/app_response#response_model", :PUT, via: :get
          match "POST", "app_nexus/handlers/app_response#response_model", :POST, via: :post
        end
      end
    end
  end
end
