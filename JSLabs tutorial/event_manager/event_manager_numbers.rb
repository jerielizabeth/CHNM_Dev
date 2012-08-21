# Dependencies
require "csv"

# Class Definition
class EventManager
  def initialize
    #puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
    
    def clean_number(original)
    	@file.each do |line|
    		number = line[:homephone]
    		clean_number = number.delete(".)( --")
    			if clean_number.length == 10
    				#Do Nothing
    			elsif clean_number.length == 11
    				if clean_number.start_with?("1")
    					clean_number = clean_number[1..-1]
    				else
    					clean_number = "0000000000"
    				end
    			else
    				clean_number = "0000000000"
    			end
    		
    		return clean_number
    		end
    	end	  
   
   
   		def print_numbers
    		@file.each do |line|
    			number = clean_number(line[:homephone])
    			puts number
    		end
    	end
    
    
  end
end

# Script
manager = EventManager.new
manager.print_numbers