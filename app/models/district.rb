class District < ApplicationRecord
  has_many :cantons, class_name: "canton", foreign_key: "district_code", primary_key: "code"
end
