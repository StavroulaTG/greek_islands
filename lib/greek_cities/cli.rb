class GreekCities::CLI

  def call
    GreekCities::City.scrape_population_mongabay
    list_cities
    menu
    goodbye
  end

  def list_cities
    puts ''
    puts "Largest Cities in Greece:"
    puts ''
    GreekCities::City.all.each.with_index(1) do |city, i|
      puts "#{i}.".colorize(:white) + "#{city.name}".colorize(:blue)

     end
   end

  def menu
    input = nil
    while input != "exit"
   puts ''
      puts  "      Enter the number of the city you'd like more info on
                          OR
              Type list to see the cities again
                           OR
                        Type exit".colorize(:green)
      puts ''
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 130
        the_city = GreekCities::City.all[input.to_i-1]
        puts ''
        puts "#{the_city.name}".colorize(:blue) + " - ".colorize(:white) + "Population:".colorize(:yellow) + "#{the_city.population}".colorize(:red) + "  Last update: ".colorize(:yellow) + "#{the_city.last_update}".colorize(:red)
        puts ''
      elsif input == "list"
        list_cities

      end
    end
  end

  def goodbye
    puts ''
    puts "Thank " .colorize(:white) + "you " .colorize(:blue) + "for " .colorize(:white) + "visiting ".colorize(:blue) +"the ".colorize(:white) + "Greek Cities!!!".colorize(:blue)
    puts ''
  end
end
