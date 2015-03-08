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
  title_array = []

  File.open("data/business.list", "r").each_line do |line|
  if line.scrub.lstrip.match(title_matcher)
    title = line.scrub.scan(title_matcher).join.strip
  end

    # CSV.new("moviegross.csv", "a+") do |csv|
    #   csv << [title, gross]
    # end
end

def gross_stripper
  gross_matcher = /(?<=GR: USD )(.*?)(?=[(])/
  seperation_matcher = /[\W]/
  gross_array = []
  grossPresent = false

  File.open("data/business.list", "r").each_line do |line|
    until grossPresent = true
      gross = line.scrub.scan(gross_matcher).join.strip
      gross_array << gross
      grossPresent = true
    end

    end



  end
end

title_stripper
gross_stripper
