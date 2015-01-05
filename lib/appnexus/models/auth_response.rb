module AppNexus
  module Models
    class AuthResponse < AppNexusBase
      include SimpleModel::Association
      define_attributes :token, :status
    end
  end
end
