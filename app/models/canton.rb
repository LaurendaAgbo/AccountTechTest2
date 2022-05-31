class Canton < ApplicationRecord
  belongs_to :district, class_name: "district", foreign_key: "district_code", primary_key: "code"
  has_many :communes, class_name: "commune", foreign_key: "canton_code", primary_key: "code"
  has_many :localities, class_name: "locality", foreign_key: "canton_code", primary_key: "code"
end
