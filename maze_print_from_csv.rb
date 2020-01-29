#! /usr/bin/env ruby
require 'csv'
require 'zlib'

if ARGV.size < 1
	printf("#{__FILE__} requires one csv file\n")
	exit
end
rawCSV = CSV.read(ARGV[0])

=begin
assign 4 x 4 square for each element of rowCSV

00    01    10    11
----  ---#  ####  ####
----  ---#  ----  ---#
----  ---#  ----  ---#
----  ---#  ----  ---#

=end

#assume that each row of rawCSV same length
width  = rawCSV.length
height = rawCSV[0].length

list4print = Array.new(height * 4).map {Array.new(width * 4)}

for rowIdx in 0..width - 1 do
	for columnIdx in 0..height - 1 do
		
		case rawCSV[rowIdx][columnIdx]
		when "00" then
			list4print[rowIdx * 4 + 0][columnIdx] = "------"
			list4print[rowIdx * 4 + 1][columnIdx] = "------"
			list4print[rowIdx * 4 + 2][columnIdx] = "------"
			list4print[rowIdx * 4 + 3][columnIdx] = "------"
		when "01" then
			list4print[rowIdx * 4 + 0][columnIdx] = "-----#"
			list4print[rowIdx * 4 + 1][columnIdx] = "-----#"
			list4print[rowIdx * 4 + 2][columnIdx] = "-----#"
			list4print[rowIdx * 4 + 3][columnIdx] = "-----#"
		when "10" then
			list4print[rowIdx * 4 + 0][columnIdx] = "######"
			list4print[rowIdx * 4 + 1][columnIdx] = "------"
			list4print[rowIdx * 4 + 2][columnIdx] = "------"
			list4print[rowIdx * 4 + 3][columnIdx] = "------"
		when "11" then
			list4print[rowIdx * 4 + 0][columnIdx] = "######"
			list4print[rowIdx * 4 + 1][columnIdx] = "-----#"
			list4print[rowIdx * 4 + 2][columnIdx] = "-----#"
			list4print[rowIdx * 4 + 3][columnIdx] = "-----#"
		else
			#raise "Unexpected element #{rawCSV[rowIdx][columnIdx]} :element shoud be 00, 01, 10 or 11"
		end
	end
end

print "\t"
for i in 1..list4print.size / 4 do
	print i, "     "
end
puts

for i in 0..list4print[0].size - 1 do
	print i / 4 + 1 if i % 4 == 0
	print "\t"
	print list4print[i].join()
	puts
end


