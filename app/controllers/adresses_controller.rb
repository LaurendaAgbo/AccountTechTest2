class AdressesController < ApplicationController
  def index
    @adresses = Adress.all
    @districts = District.all
    @street_numbers = CodePtsChss.select(:numero_rue).distinct
    @cities = Adress.select(:locality_name).distinct
    @postal_codes = Adress.select(:postal_code).distinct
    @street_names = Adress.select(:rue_name).distinct
  end
   
end
