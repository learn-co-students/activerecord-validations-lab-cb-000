class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  private
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  def clickbait
    # I need to go back and finish RegEx lessons! 
    # if !["Won't Believe", "Secret", "Top[number]", "Guess"].include?(self.title)
    #   errors.add(:title, "Choose clickbaitly title")
    # end
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
