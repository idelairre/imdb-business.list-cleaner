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

  File.open("data/business.list", "r").each_line do |line|
    # grossPresent = false
    if line.scrub.lstrip.match(title_matcher)
      title = line.scrub.scan(title_matcher).join.strip
      puts title
    end
    if line.scrub.lstrip.match(gross_matcher)
        # grossPresent = true
        gross = line.scrub.scan(gross_matcher)
        # array << { title: title, gross: gross }
        puts gross
      # elsif grossPresent == false
        # array << { title: title }
    end
      # puts array
  end
end

  title_stripper


  # example code to append to a csv

  # CSV.open("moviegross.csv", "a+") do |csv|
  #   csv << ["cow", "3","2500"]
  # end
