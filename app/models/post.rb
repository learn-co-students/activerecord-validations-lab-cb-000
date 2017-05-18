class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_includes_a_clickbait_word
  private

  def title_includes_a_clickbait_word
    return if title.blank?
    
    clickbait_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    if clickbait_words.none? { |clickbait_word| title.include? clickbait_word }
      errors.add(:clickbait, 'title must include a clickbait word')
    end
  end
end
