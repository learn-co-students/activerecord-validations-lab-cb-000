class Post < ActiveRecord::Base
  validates :title, presence: true, inclusion: {in: ["You Won't Believe These True Facts", "Secret", "Top
[number]", "Guess"]}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
end
