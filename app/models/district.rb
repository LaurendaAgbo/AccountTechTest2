class District < ApplicationRecord
  has_many :cantons, class_name: "canton", foreign_key: "districts_id"
end
