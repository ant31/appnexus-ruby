module AppNexus
  module Models
    class Error < AppNexusBase
      include SimpleModel::Association
      define_attributes :error_id, :error, :error_description, :error_code, :method, :service
      def method
        attributes[:method]
      end
    end
  end
end
