module AppNexus
  module Models
    class Auth < AppNexusBase
      include SimpleModel::Association
      define_attributes :username, :password
    end
  end
end
