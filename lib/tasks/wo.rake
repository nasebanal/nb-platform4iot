require "find"

namespace :wo do
	desc "Process Work Order"

	task :create_wo => :environment do

		Find.find(Rails.root.to_s + "/app/assets/images/waiting"){|f|
			
			next unless FileTest.file?(f)

			filename = File.basename(f)
			obstime = filename[4,14]


			#======= Move files =======

			new_file_path = Rails.root.to_s + "/app/assets/images/"
			FileUtils::mv(f, new_file_path)

			#======= Create WO =======

		  Workorder.create(:status_id => 0, :procmode_id => 0, :user_id => 0, :obstime => obstime,:data_set => filename)

			puts filename
			puts obstime
		}
	end

	task :process_wo => :environment do

		@workorders = Workorder.where(status_id: 0).order(:created_at)

		for i in 0..@workorders.length-1 do

			print "WO[", i, "] started\n"

			if @workorders[i].status_id == 0 then


				#======= Update Status =======

				@workorders[i].status_id = 1
				@workorders[i].save


				#======= Start Process =======

				#TBD


				#======= Update Status =======

				@workorders[i].status_id = 2
        @workorders[i].save


				print "WO[", i, "] executed\n"
			end

			print "WO[", i, "] ended\n"
		end
	end
end

