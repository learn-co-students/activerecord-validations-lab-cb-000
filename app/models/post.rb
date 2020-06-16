class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :must_have_click_baity_title

    def must_have_click_baity_title
        accepted_titles = [/Won't Believe/, /Secret/, /Guess/, /Top \d+/]
        if !accepted_titles.any?{|t| t.match(self.title)}
            errors.add(:title, "The title needs to be click bait")
        end
    end

end
