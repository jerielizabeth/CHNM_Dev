# Dependencies
require "csv"

# Class Definition
class EventManager
	INVALID_ZIPCODE = "00000"
	
  def initialize
    #puts "EventManager Initialized."
    filename = "event_attendees.csv"
    @file = CSV.open(filename, {:headers => true, :header_converters => :symbol})
    
    
    
	def clean_zipcode(original =line[:zipcode])
		@file.each do |line|
		
				if original.nil?
					result = INVALID_ZIPCODE
				elsif original.length < 5
					while original.length < 5
						original = "0" + clean_zipcode #Add zeros on the front
					end 
								
				else
				#Do Nothing
				end
		
			return zipcode
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
manager.clean_zipcode