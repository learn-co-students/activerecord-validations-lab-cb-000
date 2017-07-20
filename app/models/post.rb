class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    unless title =~ /Guess|Secret|Won't Believe|Top \d+/
      errors.add(:title, "must be clickbait")
    end
  end
end
