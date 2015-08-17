module AppNexus
  module Models
    class Segment < AppNexusBase
      include SimpleModel::Association
      auto_define_attributes true
      auto_find_relations true
    end
  end
end
