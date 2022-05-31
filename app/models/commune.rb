class Commune < ApplicationRecord
  belongs_to :canton, class_name: "canton", foreign_key: "canton_code", primary_key: "code"
has_many :localities, class_name: "locality", foreign_key: "commune_code", primary_key: "commune_code"
end
