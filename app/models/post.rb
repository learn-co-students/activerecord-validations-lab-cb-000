class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && record.title.include?("Won't Believe")
     record.errors[:title] << 'Need a title that is more clickbaity please'
   end

  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with ClickbaitValidator

end
