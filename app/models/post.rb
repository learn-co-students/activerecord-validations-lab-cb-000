class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    bait = ["Won't Believe", "Secret", "Top ", "Guess"]
    if title
      bait.each do |phrase|
        if title.include?(phrase)
          return nil
        end
      end
      errors.add(:title,"Must have clickbait")
    end
  end

end
