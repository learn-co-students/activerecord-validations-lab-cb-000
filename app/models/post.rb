class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 50}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not Fiction or Non-Fiction."}
  validate :is_clickbait?

  def is_clickbait?
    if title && title.match(/\b(Won't Believe|Guess|Secret|Top \d*)\b/i).blank?
      errors.add(title, 'is not clickbait-y enough')
    end
  end
end
