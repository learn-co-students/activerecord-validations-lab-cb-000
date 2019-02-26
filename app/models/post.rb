require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true

  validate :must_be_clickbaity
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def must_be_clickbaity

    words = ["Won\'t Believe", "Secret", "Top [number]", "Guess"]
    # binding.pry
    if self.title == nil || !words.any? { |w| self.title.scan(w).length > 0 }
      errors.add(:title, "Not baity enough bra")
    end
  end


end



#   def validate(record)
#     binding.pry
#     # words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
#     # if words.any? do |w| record.title.scan(w) } record.errors[:base] << "Not baity enough bra"
#   end
