module AppNexus
  module Models
    module Segment
      include         Virtus.module
      attribute       :code, String
      attribute       :state, String
      attribute       :short_name, String
      attribute       :description, String
      attribute       :member_id, Integer
      attribute       :category, String
      attribute       :price, Float
      attribute       :expire_minutes, Integer
      attribute       :enable_rm_piggyback, String
      attribute       :max_usersync_pixels, String
      attribute       :advertiser_id, Integer
      attribute       :last_modified, Time
      attribute       :provider, String
      attribute       :parent_segment_id, Integer
      attribute       :piggyback_pixels, String
      attribute       :querystring_mapping, String
      attribute       :querystring_mapping_key_value, String

      class GET
        include AppNexus::Models::Segment
        attribute       :id, Integer
      end

      class PUT
        include AppNexus::Models::Segment
      end

      class POST
        include AppNexus::Models::Segment
      end

    end
  end
end
