# Dependencies
require "csv"
require "sunlight"


# Class Definition
class EventManager
	INVALID_ZIPCODE = "00000"
	
	
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
  
    
    def clean_number(original)   		
    	clean_number = original.delete(".)( --")
    			
    		if original.length == 10
    			#Do Nothing
    		elsif original.length == 11
    			
    			if original.start_with?("1")
   					clean_number = original[1..-1]
    			else
    				clean_number = "0000000000"
    			end
    		else
    			clean_number = "0000000000"
    		end
    		
    	return clean_number
    end
      
   
   
   	def print_number
   		@file.each do |line|
    		number = clean_number(line[:homephone])
    		puts number
    	end
	end
  

    
    
    
	def clean_zipcode(original)
	
		clean_zipcode = line[:zipcode]
				if clean_zipcode.nil?
					result = INVALID_ZIPCODE
				elsif clean_zipcode.length < 5
					while clean_zipcode.length < 5
						clean_zipcode = "0" + clean_zipcode #Add zeros on the front
					end 
								
				else
				#Do Nothing
				end
		
		return clean_zipcode
	end
   
   
   	def print_zipcodes
    	@file.each do |line|
    		zipcode = clean_zipcode(line[:zipcode])
    		puts zipcode
    	end
    end
    
    
  end

# Script
manager = EventManager.new
manager.print_number
