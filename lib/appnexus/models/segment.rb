module AppNexus
  module Models
    class Segment < AppNexusBase
      include SimpleModel::Association
      auto_define_attributes false
      auto_find_relations true
      override_attributes  :code,
      :state,
      :short_name,
      :description,
      :member_id,
      :category,
      :price,
      :expire_minutes,
      :enable_rm_piggyback,
      :max_usersync_pixels,
      :advertiser_id,
      :last_modified,
      :provider,
      :parent_segment_id,
      :piggyback_pixels,
      :querystring_mapping,
      :querystring_mapping_key_value

    end
  end
end
