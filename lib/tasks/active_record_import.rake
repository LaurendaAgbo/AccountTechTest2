require 'csv'

namespace :active_record_import do
	desc "imports districts from csv to postgresql"
	districts = []
	task :district_record => :environment do
		CSV.foreach('DISTRICT.csv', headers: false) do |row|
			districts << row
		end
		newdistricts = districts.map do |attrs|
			District.new(code: attrs[0], name: attrs[1])
		end
		District.import(newdistricts)
	end
	desc "imports cantons from csv to postgresql"
   cantons = []
   task :canton_record => :environment do
    CSV.foreach('CANTON.csv', headers: false) do |row|
      cantons << row
    end
    newcantons = cantons.map do |attrs|
      Canton.new(code: attrs[0], name: attrs[1], district_code: attrs[3])
    end
		Canton.import(newcantons)
   end

	 task :all => [:district_record, :canton_record]

end
