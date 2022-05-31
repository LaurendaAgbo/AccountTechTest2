class Commune < ApplicationRecord
  belongs_to :canton, class_name: "canton", foreign_key: "canton_id"
has_many :localities, class_name: "locality", foreign_key: "communes_id"
end
