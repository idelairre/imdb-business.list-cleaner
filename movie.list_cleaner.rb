require "csv"
require "pry"


# output = File.new("/data/moviegross.csv")


# CSV.open("moviegross.csv", "wb") do |csv|
#   csv << ["title", "total_gross"]
# end

# it will need to go line by line matching movies to their gross revenue
# it will need to assign the movie name to a key "title" and the gross return to a key "total_gross"

# find the characters beyond "GR" and match them to the movie "MV"




def title_stripper
  title_matcher = /(?<=MV: )(.*?)(?=[(])/
  gross_matcher = /(?<=GR: USD )(.*?)(?=[(])/

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

array = []
grossPresent = false
alreadyHasGross = false
titlePresent = false
  File.open("data/business.list", "r").each_line do |line|
    # grossPresent = false
    if line.scrub.lstrip.match(title_matcher)
      titlePresent = true
      title = line.scrub.scan(title_matcher).join.strip
      if line.scrub.lstrip.match(gross_matcher) == true
        grossPresent = true
        gross = line.scrub.scan(gross_matcher).join.strip
        puts title
        puts gross
      end
    end

    # if grossPresent == true
    #   # array << { title: title, gross: gross }
    #   alreadyHasGross = true
    # else
    #   grossPresent = false
    # end

    # if titlePresent == true && grossPresent == false
    #   puts title
    # end

    # if titlePresent == true && grossPresent == true
    #   puts title
    #   puts gross
    # end
  end

    puts array
    # CSV.new("moviegross.csv", "a+") do |csv|
    #   csv << [title, gross]
    # end
end

title_stripper

