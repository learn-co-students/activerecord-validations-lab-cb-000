class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} does not match the available categories. Please select either Fiction or Non-Fiction." }
  validate :clickbaity?

  PATTERNS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbaity?
    if PATTERNS.none? { |p| p.match title}
      errors.add(:title, "must be clickbait")
    end
  end
end
