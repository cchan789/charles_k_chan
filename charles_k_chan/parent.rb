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
    ask = ask.to_s
    tarr = ask.split(' ')
    rlen = tarr.length
    if hoursofsleep >= rlen
      puts "Okay, since you said #{ask} so nicely."
      answer = true
    else
      puts "Not today, sweetie."
      answer = false
    end
    @past_requests[ask] = answer
    answer
  end
  
  
end

joe = Parent.new('joe', 5)
bob = Parent.new('bob', 6)
mary = Parent.new('mary', 4)
mary.greet_child
tesarr = ["can i have dog","buy me car", "please can I have an jet", "could i possibly have access to a new phone", "I would very much like for your to acquire an antique clock for me"]
tesarr.each do |testring|
  bob.hear_request(testring)
end