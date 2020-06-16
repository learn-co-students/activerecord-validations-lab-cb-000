require 'byebug'
class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :content, :minimum => 250 
  validates_length_of :summary, :maximum => 250 
  validates_inclusion_of :category,  :in => %w(Fiction Non-Fiction)
  validate :clickbait?


   def clickbait?
     if /Won't Believe|Secret|Guess/.match(title) || /Top [0-9]+/.match(title)
       true
     else
       errors.add(:title, "must be clickbait") 
     end
   end
 end

