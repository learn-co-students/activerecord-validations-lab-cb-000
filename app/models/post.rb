class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_does_not_contain_specified_words


  def title_does_not_contain_specified_words 
    if !title.nil? && !["Won't Believe","Secret","Top","Guess"].any? {|word| title.include?(word)}
      errors.add(:title, "Does not include the clickbait words.")
    end 
  end 
end
