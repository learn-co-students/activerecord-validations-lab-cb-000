class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    errors.add(:title, "must be Clickbait-y") unless (title && title.include?("Won't Believe" || "Secret" || "Top"|| "Guess"))
  end
end
