class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate  :clickbaity?
  
  CLICKBAIT = [/Won't Believe/, /Secret/, /Top [0-9]/,/Guess/]
  
  def clickbaity?
    if CLICKBAIT.none? { |phrase| phrase.match title }
            errors.add(:title, "must be clickbait")
    end
 end
  
  
end
