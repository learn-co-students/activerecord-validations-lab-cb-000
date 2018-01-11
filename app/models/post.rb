class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbaity

  def clickbaity
    if self.title && !(["Won't Believe", "Secret", "Top", "Guess"].any?{|w| self.title.include?(w)})
      errors.add(:no_clickbait, "Not clickbait-y enough!")
    end
  end

end
