task :test_task => :environment do

	@workorders = Workorder.all

	for i in 0..@workorders.length-1 do

		print "WO[", i, "] started\n"

		command = "ls"
#		system command

		if @workorders[i].status == 0 then

			@workorders[i].status = 1
			@workorders[i].save

			print "WO[", i, "] executed\n"
		end

		print "WO[", i, "] ended\n"

	end

  puts "done."
end

