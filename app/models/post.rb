class Post < ActiveRecord::Base
	
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :clickbait?


	PHRASES =  [
    /Won't Believe/i,
    /Secret/i,
    /Top \d+/i,
    /Guess/i
  	]


  	def clickbait?
  		# Finally, add a custom validator to Post that ensures the title is 
		# sufficiently clickbait-y. If the title does not contain 
		# "Won't Believe", "Secret", "Top [number]", or "Guess", 
		# the validator should return false.

		if PHRASES.none? { |phrase| phrase.match(title) }
			errors.add(:title, "Title must be clickbait-y")
		end
	end



end
