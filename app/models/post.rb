class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

    def clickbait
      unless /(Won't Believe)|(Secret)|(Top \d+)|(Guess)/.match(title)
       errors.add(:title, 'must be clickbait')
     end
   end

end
