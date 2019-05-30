class Post < ActiveRecord::Base


    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbaity_title


    def clickbaity_title
      if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.match(/Top\s\d+/)
        errors.add(:title,  "It's not clickbait-y enough!")
      end
    end


end
