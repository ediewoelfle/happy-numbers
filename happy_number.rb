# Happy numbers - each digit squared, add them all up, if 1, then we're a happy number 
def happy_number(number, prev_results = [])
	# convert the number to a string
	str_number = number.to_s

	#puts str_number

	# convert the string to a character array? 
	char_numbers = str_number.chars.to_a 

	#puts char_numbers

	# our result for printout 
	result = 0

	# cycle through each number and add them up
	char_numbers.each do |number|
		squared_number = number.to_i * number.to_i
		result += squared_number

		#puts result
	end 

	# has this result been in the results before 
	result_seen = false

	# go through the previous results - it's the long way 
	prev_results.each do |p_res|
		if result == p_res
			result_seen = true
		end 
	end 

	# check if our number is happy, otherwise, please continue 
	if result == 1
		puts "#{result} is a happy number!"
	elsif result_seen == false 
		puts "#{result} is NOT a happy number!"
		prev_results.push(result)
		happy_number(result, prev_results)
	end 
end 

# return the sum of an array of numbers 
def happy_sum(numbers)
	results = []

	# go through each index 
	(0..numbers.count - 1).each do |i|
		# get the individual number, because that could be the highest "sum"
		results.push(numbers[i].to_i)

		# get a smaller array, starting at index i 
		broken_numbers = numbers[i..numbers.count]

		# go through the new array and get the sum
		(1..broken_numbers.count).each do |j|
			# add the addition of our smaller array to the overall results 
			results.push(array_sum(broken_numbers[0..j]))
		end 
	end 

	# get the max sum in our array 
	result = results.max
	
	puts "#{result} is the best sum we can get."
end 

# get the sum of the passed array 
def array_sum(numbers)

	# the result of the array sum
	result = 0

	# add the array
	numbers.each do |number|
		result += number.to_i
		#puts result
	end 

	# return the result 
	return result
end 