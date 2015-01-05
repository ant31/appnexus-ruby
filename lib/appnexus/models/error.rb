module AppNexus
  module Models
    class Error < AppNexusBase
      include SimpleModel::Association
      define_attributes :error_id, :error, :error_description, :error_code, :method, :service
    end
  end
end
