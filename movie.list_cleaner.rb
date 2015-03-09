require "pry"

class Movie

  attr_accessor :title, :total_gross

  def initialize(title)
    @title = title
    @total_gross = 0
  end

  def to_s
    "movie: { title => #{title}, total gross => #{total_gross} }"
  end
end

def stripper
  title_matcher = /(?<=MV: )(.*?)(?=[(])/
  gross_matcher = /(?<=GR: USD )(.*?)(?=[(])/
  movie = nil
  array = []
  movie_start = true

  File.open("data/business.list", "r").each_line do |line|
    if line.scrub.lstrip.match(title_matcher)
      if movie_start == false
        array << movie
      end
      movie_start = true
  		title = line.scrub.scan(title_matcher).join.strip
      movie = Movie.new(title)
    elsif line.scrub.lstrip.match(gross_matcher)
      movie_start = false
      currency, total_gross, country = line.split('GR: ').last.split(" ")
      movie.total_gross += total_gross.gsub(',', '_').to_i
    end
  end
  puts array
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

    # array << {title: @title, gross: @gross_array}

    # @gross_count = 0
    # @grossPresent = false
    # @titlePresnt = false
  # end
    # if @grossPresent == true && @titlePresent == true
    #   array << {title: @title, gross: @gross}
    #   @grossPresent = false
    #   @titlePresent = false
    #   # @title_count = 0
    #   @gross_count = 0
   #    elsif @titlePresent == true && @grossPresent == false
    #   array << {title: @title, gross: nil}
    #   @grossPresent = false
    #   @titlePresent = false
    #   # @title_count = 0
    #   @gross_count = 0
  #     end
