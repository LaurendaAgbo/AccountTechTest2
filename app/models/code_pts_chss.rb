class CodePtsChss < ApplicationRecord
  has_many :cptch_rues, class_name: 'Rue', foreign_key: 'cptch_type_rue' 
  has_many :cptch_rues, class_name: 'Rue', foreign_key: 'cptch_numero_rue'
end
