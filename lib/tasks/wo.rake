require "find"

namespace :wo do
	desc "Process Work Order"

	task :create_wo => :environment do

		Find.find(Rails.root.to_s + "/app/assets/images/waiting"){|f|
			
			next unless FileTest.file?(f)

			filename = File.basename(f)
			Workorder.create(:status => 0, :data_set => filename)

			new_file_path = Rails.root.to_s + "/app/assets/images/"
			FileUtils::mv(f, new_file_path)
			puts filename
		}
	end
end

