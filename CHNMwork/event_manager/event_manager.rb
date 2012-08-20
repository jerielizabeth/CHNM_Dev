# Dependencies
require "csv"

# Class Definition
class EventManager
  def initialize
    puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
    #def print_names
    #	@file.each do |line|
    	#puts line.inspect
     # 	puts line[:first_name] + " " + line[:last_name]
    #	end
  	#end
  	def print_numbers
  		@file.each do |line|	
  			number = line[:homephone]
  			#puts number
  			clean_number = number.delete(".")
  			puts clean_number
  			
  		end
  	end
  	
  end
end

# Script
manager = EventManager.new
#manager.print_names
manager.print_numbers