class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :title_is_clickbaity

  def title_is_clickbaity
    if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.match(/Top\s\d+/)
      errors.add(:title, "is not clickbaity enough!")
    end
  end
end
