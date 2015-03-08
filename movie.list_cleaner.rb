require "csv"
# require "pry"

def stripper
  title_matcher = /(?<=MV: )(.*?)(?=[(])/
  gross_matcher = /(?<=GR: USD )(.*?)(?=[(])/
  seperation_matcher = /[\W]/
  @title_count = 0
  @gross_count = 0
  array = []
  @grossPresent = false
  @titlePresent = false

  File.open("data/business.list", "r").each_line do |line|
    if line.scrub.lstrip.match(title_matcher)
		@title = line.scrub.scan(title_matcher).join.strip
		# @title_count += 1
		@titlePresent = true
		# puts title
    elsif line.scrub.lstrip.match(gross_matcher)
		@gross = line.scrub.scan(gross_matcher).join.strip
		@gross_count += 1
		@grossPresent = true
  	elsif line.scrub.lstrip.match(title_matcher) && titlePresent == true
  		@grossPresent = false
    end
    if @titlePresent == true && @grossPresent == true && @gross_count > 1
    	until line.match("")
			@gross_count += 1
			@gross_array << @gross
		end
			array << {title: @title, gross: @gross_array}
			@gross_count = 0
			@grossPresent = false
			@titlePresnt = false
	elsif @grossPresent == true && @titlePresent == true
		array << {title: @title, gross: @gross}
		@grossPresent = false
		@titlePresent = false
		# @title_count = 0
		@gross_count = 0
  	elsif @titlePresent == true && @grossPresent == false
		array << {title: @title, gross: nil}
		@grossPresent = false
		@titlePresent = false
		# @title_count = 0
		@gross_count = 0
    end
    puts array
  end
end

stripper

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
