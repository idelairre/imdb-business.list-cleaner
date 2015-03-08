require "csv"
require "pry"


# output = File.new("/data/moviegross.csv")


# CSV.open("moviegross.csv", "wb") do |csv|
#   csv << ["title", "total_gross"]
# end

# it will need to go line by line matching movies to their gross revenue
# it will need to assign the movie name to a key "title" and the gross return to a key "total_gross"

# find the characters beyond "GR" and match them to the movie "MV"

# string = File.open("data/business.list", "r") { |f| f.read }

# array1 = string.scrub.scan(title_matcher).inject do |memo, title|
#   memo << { title: title.join.strip }
# end
# # puts array1

# array2 = string.scrub.scan(gross_matcher).inject do |memo, gross|
# memo << { gross: gross.join.strip }


# puts array2
# end
# array2 = string.scan(gross_matcher).inject([]) do |memo, gross|
#   memo << {:gross => gross.gsub("\n", '')}
# end

# compare against the key value pair, if the value for gross isn't nil, add it. ???

def title_stripper
  title_matcher = /(?<=MV: )(.*?)(?=[(])/
  gross_matcher = /(?<=GR: USD )(.*?)(?=[(])/
  seperation_matcher = /[\W]/
  @title_count = 0
  @gross_count = 0
  array = []
  grossPresent = false
  hasGross = false

  File.open("data/business.list", "r").each_line do |line|
    if line.scrub.lstrip.match(title_matcher) && hasGross == false
		@title = line.scrub.scan(title_matcher).join.strip
		@title_count += 1
		@gross_count = 0
    elsif line.scrub.lstrip.match(title_matcher) && hasGross == true
		@title = line.scrub.scan(title_matcher).join.strip
		@title_count += 1
		@gross_count += 1
		# puts title
	# elsif line.scrub.lstrip.match(gross_matcher) && hasGross == true
	# 	@gross_count += 1
	elsif line.scrub.lstrip.match(gross_matcher)
		@gross = line.scrub.scan(gross_matcher).join.strip
		@gross_count += 1
		# puts gross
		# grossPresent = true
		hasGross = true
	end
	if @title_count == 1 && hasGross == true
		array << {title: @title, gross: @gross}
		@title_count = 0
		# grossPresent == false
		@gross_count = 0
	# elsif @title_count > @gross_count
	# 	array << {title: @title, gross: nil}
	# 	@title_count = 0
	# 	@gross_count = 0
	end
	puts array
  # puts gross_count
  # puts title_count
end
end

title_stripper
# gross_stripper
