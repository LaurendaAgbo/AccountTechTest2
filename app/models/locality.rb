class Locality < ApplicationRecord
  belongs_to :commune, class_name: "commune", foreign_key: "commune_id"
  belongs_to :canton, class_name: "canton", foreign_key: "canton_id"
  has_many :rues, class_name: "rue", foreign_key: "rue_id"
end
