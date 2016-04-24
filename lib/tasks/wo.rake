require "find"

namespace :wo do
	desc "Process Work Order"

	task :create_wo => :environment do

		obstime = "-"
		dirs = Dir.glob(Rails.root.to_s + "/app/assets/images/waiting/**")

		dirs.each{|d|
			
			next unless FileTest.directory?(d)

			path, dirname = File.split(d)

			Find.find(d){|f|
				next unless FileTest.file?(f)

				filename = File.basename(f)

				if metafile = filename.match(/(.+).meta/) then

					obstime = metafile[1]
				end
			}


			#======= Move files =======

			new_dir_path = Rails.root.to_s + "/app/assets/images/"
			FileUtils::mv(d, new_dir_path)

			#======= Create WO =======

		  Workorder.create(:status_id => 0, :procmode_id => 0, :user_id => 0, :obstime => obstime,:data_set => dirname)

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

