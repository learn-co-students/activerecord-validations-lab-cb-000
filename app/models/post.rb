class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :content, length: { in: 250..500}
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w( Fiction Non-Fiction )}
    validate :is_clickbait?

    private

    def is_clickbait?
        click_bait = [
          /Won't Believe/i,
          /Secret/i,
          /Top [0-9]*/i,
          /Guess/i
        ]

        if click_bait.none? { |phrase| phrase.match title }
            errors.add(:title, "must be clickbait!")
        end
    end
end
