class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
    if title
      if !(title.include?("Won't Believe") || title.include?("Top [number]") || title.include?("Guess"))
        errors.add(:title, "That's wont do it")
      end
    end
  end
end
