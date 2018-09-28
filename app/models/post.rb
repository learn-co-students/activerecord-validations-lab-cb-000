class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait


  def clickbait
    bait = ["Won't Believe", "Secret", "Top ", "Guess"]
    if title
      errors.add(:title, "Must have clickbait") unless (bait.collect{|phrase| title.include?(phrase)}.include?(true))
    end
  end

end
