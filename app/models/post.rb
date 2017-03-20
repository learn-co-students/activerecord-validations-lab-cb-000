class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-Fiction), message: "%{value} is not a valid category" }

  PATTERNS =  [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait?
    if PATTERNS.none? {|p| p.match title}
      errors.add(:title, "must be clickbait title")
    end
  end
end
