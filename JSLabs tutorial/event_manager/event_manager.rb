# Dependencies
require "csv"

# Class Definition
class EventManager
  def initialize
    #puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
    
	def clean_zipcode(original)
		@file.each do |line|
    		clean_zipcode = line[:zipcode]
			
				if clean_zipcode.length < 5
					clean_zipcode = "0" + clean_zipcode #Add zeros on the front
				else
				#Do Nothing
				end
		
			return clean_zipcode
		end
	end
   
   
   	def print_zipcodes
    	@file.each do |line|
    		zipcode = clean_zipcode(line[:zipcode])
    		puts zipcode
    	end
    end
    
    
  end
end

# Script
manager = EventManager.new
manager.print_zipcodes