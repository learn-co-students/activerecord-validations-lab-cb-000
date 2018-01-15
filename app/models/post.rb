class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: {maximum: 299 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :is_clickbait?

  NOT_CLICKBAIT = [
    /^True Facts/
  ]

  def is_clickbait?
    if NOT_CLICKBAIT.any? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
