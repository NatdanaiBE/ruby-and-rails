ar = Array[1,2,3,4,5,6]
ar2 = Array[1,3,5,7,9,11]
print "> "
input = $stdin.gets.to_i
ar2[3..4] = input
ar3 = ar & ar2
member = ar3.assoc(3)
ar4 = ar3.map {
	|a| 2 ** a
}

puts "#{ar2}"
puts "#{ar4}"