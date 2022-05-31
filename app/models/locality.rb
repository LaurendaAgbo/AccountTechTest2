class Locality < ApplicationRecord
  belongs_to :commune, class_name: "commune", foreign_key: "commune_code", primary_key: "code"
  belongs_to :canton, class_name: "canton", foreign_key: "canton_code", primary_key: "code"
  has_many :rues, class_name: "rue", foreign_key: "locality_number", primary_key: "number"
end
