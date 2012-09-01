# Dependencies
require "csv"
require "sunlight"

# Class Definition
class EventManager
  def initialize
    puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
  end
   
  def print_names
    	@file.each do |line|
    		#puts line.inspect
    		puts line[:first_name] + " " + line[:last_name]
    	end
  end	
  
end

# Script
manager = EventManager.new
manager.print_names