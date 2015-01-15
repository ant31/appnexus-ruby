module AppNexus
  module Models
    class Advertiser < AppNexusBase
      include SimpleModel::Association
      auto_define_attributes false
      auto_find_relations true
      override_attributes  :id,
                           :code,
                           :name,
                           :state,
                           :default_brand_id,
                           :remarketing_segment_id,
                           :profile_id,
                           :control_pct,
                           :timezone,
                           :last_modified,
                           :billing_name,
                           :billing_phone,
                           :billing_address1,
                           :billing_address2,
                           :billing_city,
                           :billing_state,
                           :billing_country,
                           :billing_zip,
                           :default_currency,
                           :use_insertion_orders,
                           :time_format,
                           :is_malicious,
                           :is_mediated,
                           :billing_internal_user,
                           :default_category,
                           :default_brand,
                           :labels,
                           :competitive_brands,
                           :competitive_categories,
                           :thirdparty_pixels,
                           :lifetime_budget,
                           :lifetime_budget_imps,
                           :daily_budget,
                           :daily_budget_imps,
                           :enable_pacing,
                           :allow_safety_pacing,
                           :lifetime_pacing,
                           :lifetime_pacing_span,
                           :stats

    end
  end
end
