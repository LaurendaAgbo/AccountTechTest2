class Rue < ApplicationRecord
  belongs_to :cptch_type_rue, class_name: "code_pts_chss"
  belongs_to :cptch_numero_rue, class_name: "code_pts_chss"
  belongs_to :localite_id, class_name: "locality"
end
