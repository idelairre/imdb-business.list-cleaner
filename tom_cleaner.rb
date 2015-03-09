class Movie

  attr_accessor :title, :gross

  def initialize(title)
    @title = title
    @gross = 0
  end

  def to_s
    "title: #{title}, gross: #{gross}"
  end
end

movie = nil
start_movie = true
movies  = []

# File.open("data/small.list", "r").each_line do |line|
File.open("data/business.list", "r").each_line do |line|
  begin

    if line.index('MV:') == 0
      if !start_movie
        # Save the previous movie
        puts "Adding Movie: #{movie}"
        movies << movie
      end
      start_movie = true
      title = line.split('MV: ').last.split('(').first.strip
      # create a new movie
      movie = Movie.new(title)
    elsif line.index('GR:') == 0
      start_movie = false
      currency, gross, country = line.split('GR: ').last.split(" ")

      # May need to do a currency conversion here, probably to US currency
      movie.gross += gross.gsub(',', '_').to_i
    end
  rescue ArgumentError => e
    # Going to ignore this error:
    # invalid byte sequence in UTF-8
    # puts "Arg Error: #{e}"
  end
end
