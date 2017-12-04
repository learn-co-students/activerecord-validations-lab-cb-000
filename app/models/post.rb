class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            record.title.match(/Won't|Believe|Secret|Top \d*|Guess/) ? true : record.errors[:base] << "Not enough clickbait"
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, Inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates_with ClickbaitValidator
end