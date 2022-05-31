require 'csv'

namespace :import_commune_localite do
  desc "imports CodePtsChss from csv to postgresql"
  cptchs = []
  task :cptchs_record => :environment do
    # CSV.foreach('CPTCH.csv', headers: false) do |row|
    #   cptchs << row
    # end
    cptchs_text = File.read('CPTCH.csv').encode("UTF-8", invalid: :replace, replace: "")
    cptchs_csv = CSV.parse(cptchs_text, :headers => false)
    cptchs_csv.each do |row|
      cptchs << row
    end
    newcptchs = cptchs.map do |attrs|
      CodePtsChss.new(type_rue: attrs[0], numero_rue: attrs[1])
    end
    CodePtsChss.import(newcptchs)
  end
  desc "imports adresses from csv to postgresql"
  adresses = []
  task :adress_record => :environment do
  #  CSV.foreach('TR.DICACOLO.RUCP.csv', headers: false) do |row|
  #    adresses << row
  #  end
    adresses_text = File.read('TR.DICACOLO.RUCP.csv').encode("UTF-8", invalid: :replace, replace: "")
    adresses_csv = CSV.parse(adresses_text, :headers => false)
    adresses_csv.each do |row|
      adresses << row
    end
    newadresses = adresses.map do |attrs|
      Adress.new(district_name: attrs[0], canton_name: attrs[1], commune_name: attrs[2], locality_name: attrs[3], rue_name: attrs[4], postal_code: attrs[5])
    end
    Adress.import(newadresses)
  end
  
  task :all => [:cptchs_record, :adress_record]
end
