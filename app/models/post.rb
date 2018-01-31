class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    if self.title == nil
      errors.add(:title, "Needs a title.")
    else
      clicky = ["won't", "believe", "secret", "top", "guess"]
      title = self.title.split(" ")
      if !title.any?{|word| clicky.include?(word.downcase)}
        errors.add(:non_clickbait, "Title not clickbaitable")
      end
    end
  end
end
