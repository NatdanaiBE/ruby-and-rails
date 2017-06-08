class Interval
	#attr_reader :startTime ,:endTime ,:reward ,:commulativeReward ,:lastTaskAvailable
	#attr_writer :startTime ,:endTime ,:reward ,:commulativeReward ,:lastTaskAvailable
	attr_accessor :startTime ,:endTime ,:reward ,:commulativeReward ,:lastTaskAvailable
	def initialize(startTime,endTime,reward)
		@startTime = startTime
		@endTime = endTime
		@reward = reward
		@commulativeReward = 0
		@lastTaskAvailable = -1
	end
end


print 'tasks > '
numberOfTasks = $stdin.gets.to_i
$intervals = Array.new(numberOfTasks)
for i in 0..numberOfTasks - 1 do
	print 'start time > '
	startTime = $stdin.gets.to_i
	print 'end time > '
	endTime = $stdin.gets.to_i
	print 'reward > '
	reward = $stdin.gets.to_i
	$intervals[i] = Interval.new(startTime,endTime,reward)
end
for $i in 0..numberOfTasks - 1 do
	print "tasks number #$i start time "
	print $intervals[$i].startTime 
	print " end time "
	print $intervals[$i].endTime 
	print " reward "
	puts $intervals[$i].reward
end
for i in 1..numberOfTasks - 1 do
	j = i
	while $intervals[j].endTime > $intervals[i].startTime and j > 0 do
		j = j - 1
	end	
	if $intervals[j].endTime <= $intervals[i].startTime then $intervals[i].lastTaskAvailable = j
	end
end

$intervals[0].commulativeReward = $intervals[0].reward
for i in 1..numberOfTasks - 1 do
	if $intervals[i].reward + $intervals[$intervals[i].lastTaskAvailable].commulativeReward < $intervals[i - 1].commulativeReward then $intervals[i].commulativeReward = $intervals[i - 1].commulativeReward
	else 
		$intervals[i].commulativeReward = $intervals[i].reward + $intervals[$intervals[i].lastTaskAvailable].commulativeReward
		$tasksIterated = i
	end
end
File.open("ASIFIKNOW.txt","w") do |writer|
	while $tasksIterated >= 0 do
		writer.write("tasks number #$tasksIterated start time ")
		writer.write($intervals[$tasksIterated].startTime)
		writer.write(" end time ")
		writer.write($intervals[$tasksIterated].endTime)
		writer.write(" reward ")
		writer.write($intervals[$tasksIterated].reward)
		writer.write("\r\n")
		print "ended tasks number #$tasksIterated start time "
		print $intervals[$tasksIterated].startTime 
		print " end time "
		print $intervals[$tasksIterated].endTime 
		print " reward "
		puts $intervals[$tasksIterated].reward
		$tasksIterated = $intervals[$tasksIterated].lastTaskAvailable
	end
end
puts $intervals[$tasksIterated].commulativeReward
for i in 0..numberOfTasks - 1 do
	puts $intervals[i].commulativeReward
end
