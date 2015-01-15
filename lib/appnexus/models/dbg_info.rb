module AppNexus
  module Models
    class DbgInfo < AppNexusBase
      include SimpleModel::Association
      auto_define_attributes true
    end
  end
end
