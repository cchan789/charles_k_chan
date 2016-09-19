#pseudocode for question 8 is in class body below diplay_request_history

class Parent
  @name
  @hoursofsleep
  @past_requests
  
  attr_accessor :name
  attr_reader :hoursofsleep
  
  def initialize(name, hoursofsleep)
    name = name.to_s
    hoursofsleep = hoursofsleep.to_f
    @name = name
    @hoursofsleep = hoursofsleep
    @past_requests = {}
    # past requests will store request as key, and whether the request was granted as a boolean (true means yes, false means no)
  end
  
  def greet_child
    puts "*yaaaawn* I'm up, I'm up. #{@name} is up. What's the matter?"
  end

  def hear_request(ask)
    ask = ask
    tarr = ask.split(' ')
    rlen = tarr.length
    #rlen is the number of words in the request
    #puts hoursofsleep
    #puts rlen
    if hoursofsleep >= rlen
      puts "Okay, since you said '#{ask}' so nicely."
      answer = true
    else
      puts "Not today, sweetie."
      answer = false
    end
    @past_requests[ask] = answer
    answer
  end
  
  def display_request_history
    @past_requests.each do |ask,bool|
      if bool
        temp = "was granted"
      else
        temp = "was not granted"
      end
      puts "The request was '#{ask}' and it #{temp}"
    end
  end
  
  # define the most vowels method
  # make a sample string with the vowels "aeiou"
  # loop through the past requests hash with each_key (or just loop through, but we need the keys)
  # make an array to hold all the words from the requests
  # make an array to hold all the vowel counts for each word from the requests
  # for each key, cast it to string in case it isnt, make it lowercase and assign it to a temporary value(they should already be strings, but just in case)
  # for each key split the temp string, and add that array to the one holding all the words for the requests
  # end that loop
  # for each index in the array holding all the words from the requests, break it up into its characters 
  # for each index in the array holding all the words from the requests, make a temp variable for vowel count
  # for each character that each word has been broken up into, check if the sample string includes that character
  # if it does, add 1 to the vowel count
  # end that loop
  # push that vowel count temporary variable to the array holding the vowel count
  # end that loop
  # make a variable to hold an index number (default value to 0)
  # for each index in the vowel count array, check if the value is larger than the value at the variable holding an index number, and if so, update the variable holding the index number to the current one
  # for each index in the vowel count array, check if the value is equal to the one at the varaible holding an index number, and if so, print the value at that index in the array holding all the words from the requests
  
  def drinkcoffee(cups)
    cups = cups.to_i
    if cups <=0
      puts "that's not helping me awake"
    elsif cups <= 2
      @hoursofsleep += cups
    elsif cups <= 5
      @hoursofsleep += 2 + ((cups - 2)/2)
    else
      @hoursofsleep += 3.5 + ((cups - 5)/3)
    end
    
  end
  
  
end

# joe = Parent.new('joe', 5)
# bob = Parent.new('bob', 6)
# mary = Parent.new('mary', 4)
# mary.greet_child
# tesarr = ["can i have dog","buy me car", "please can I have an jet", "could i possibly have access to a new phone", "I would very much like for your to acquire an antique clock for me"]
# tesarr.each do |testring|
#  bob.hear_request(testring)
# end
# bob.display_request_history

puts "Please input the parent's name"
name = gets.chomp.to_s
puts "Please input the hours of sleep they got last night"
hrsleep = gets.chomp.to_f
par = Parent.new(name,hrsleep)
par.greet_child
failedreq = 0
askarr = []
while failedreq < 5
  puts "So, what's the matter?"
  repeat = false
  ask = gets.chomp.to_s
  
  askarr.each do |ind|
    if ind == ask
      repeat = true
    else
    end
  end
  if ask.length == 0
    puts "If you're not going to say anything, I'm going back to sleep"
    # handling blank request by auto terminating, doesn't add blank requests to past requests
    failedreq = 5
  elsif repeat
    puts "Now you're just repeating yourself, that's not helping"
    # handle repeat by incrementing failed request counter faster, prevents adding repeated requests to the past_requests hash
    failedreq += 2
  else
    askarr.push(ask)
    a = par.hear_request(ask)
    if !a
      failedreq +=1
    else
    end
  end
end
#par.display_request_history
puts "looks like it's naptime!"
