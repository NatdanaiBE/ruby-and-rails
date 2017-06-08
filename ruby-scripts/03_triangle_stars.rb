print '> '
input = $stdin.gets.to_i
for	i in 0..input do
	for	j in 0..(input - i - 1) do
		print '* '
	end
	print "\n"
end
