class Canton < ApplicationRecord
  belongs_to :district, class_name: "district", foreign_key: "district_id"
  has_many :communes, class_name: "commune", foreign_key: "cantons_id"
  has_many :localities, class_name: "locality", foreign_key: "cantons_id"
end
