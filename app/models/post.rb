class PostValidator < ActiveModel::Validator
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  def validate(record)

    if CLICKBAIT_PATTERNS.none? { |pat| pat.match record.title }
      record.errors.add(:title, "must be clickbait")
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: %w(Fiction Non-fiction)
  validates_with PostValidator
end
