

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait

  def clickbait
    words = [/Won't Believe/i, /Secret/i, /Top [1..10]/i, /Guess/i]

    clickbaity = words.collect do |word|
      title.to_s.index (word)
    end.first

    if !clickbaity
      errors.add(:title, "Not clickbait-y")
    end
  end
end
