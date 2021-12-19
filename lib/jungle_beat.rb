class JungleBeat
 attr_reader :list

 def initialize
   @list = LinkedList.new
 end

 def append(string)
   words_array = string.split(" ")
   words_array.each do |word|
     list.append(word)
   end
 end

 def count
   @list.count
 end

 def play
   sound = list.to_string
   `say -r 500 -v Alice #{sound}`
 end
end
