module AppNexus
  module Models
    class Report < AppNexusBase
      include SimpleModel::Association
      define_attributes :reports, :status
    end
  end
end
