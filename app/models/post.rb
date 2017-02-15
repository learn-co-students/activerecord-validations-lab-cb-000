class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait?

  def click_bait?
    bait = [/Won't Believe/,/^Secret/,/^Top \d+/,/^Guess/]
    unless bait.any? {|b| b.match title}
      errors.add(:title, "totally clickbait!")
    end  
  end
end
