class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction) }
  validate :is_clickbait

  def is_clickbait
    if self.title
      if ["won't believe", "secret", "Top #{/\d+/}", "guess"].any? { |clickbait| self.title.downcase.include?(clickbait) } == false
        errors.add(:title, "Not clickbait!")
      end
    end
  end
end
