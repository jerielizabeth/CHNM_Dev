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
  	def clean_number (original)
  		@file.each do |line|	
  			number = line[:homephone]
  			
  			clean_number = number.delete(".") 	
  		  	clean_number1 = clean_number.delete("-")
  		  	clean_number2 = clean_number1.delete("(")
  		  	clean_number3 = clean_number2.delete(")")
  		  	clean_number4 = clean_number3.delete(" ")
  		  	
  		  	return clean_number4
  	end  	
  	
  	def print_numbers
    	@file.each do |line|
      		number = clean_number(line[:homephone])
      		puts number
   		 end
  	end
  
 end

# Script
manager = EventManager.new
#manager.print_names
manager.print_numbers