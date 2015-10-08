class HomeController < ApplicationController

 def index

 end


 def show
   @words = Array.new
   if params[:step1] != ""
     @words.push(params[:step1])
   end
   if params[:step2] != ""
     @words.push(params[:step2])
   end
   if params[:step3] != ""
     @words.push(params[:step3])
   end
   if params[:step4] != ""
     @words.push(params[:step4])
   end
   if params[:step5] != ""
     @words.push(params[:step5])
   end
   @validWord = true
   @words.each_with_index { |x,i| 
     if i == 0
       @validWord = edit_distance_of_one params[:startWord], x
     elsif i != @words.length-1
       @validWord = edit_distance_of_one @words[i-1], x 
     else
       @validWord = edit_distance_of_one x, params[:endWord]
     end
   }
   if @words.length == 0
     @validWord = false
   end
   @startWord = params[:startWord]
   @endWord = params[:endWord]
 end
end
