class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?


  Clickbait = [
    /Top [0-9]*/i,
    /Guess/i,
    /Won't Believe/i,
    /Secret/i
  ]

  def clickbait?
    if Clickbait.none? { |phrase| phrase.match title}
      errors.add(:title, "is not clickbait")
    end
  end

end
