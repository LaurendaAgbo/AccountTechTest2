class AdressesController < ApplicationController
  def index
    @adresses = Adress.all
    @districts = District.all
    @street_numbers = CodePtsChss.select(:numero_rue)
  end
   
end
