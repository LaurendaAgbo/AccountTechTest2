class Rue < ApplicationRecord
  belongs_to :locality, class_name: "locality", foreign_key: "locality_number", primary_key: "number"
end
