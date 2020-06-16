class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :title, length: { minimum: 1 }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    #validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    #validates :title , inclusion: { in: ^.*\b(Wont Believe|Secret|Guess)\b.*$ }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

     def clickbait?
       return if title.blank?

       if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
         errors.add(:title, "must be clickbait")
       end

     end

    #inclusion: { within: %w(/Won't Believe/ /Secret/ /Guess/ /Top/),
    #message: "***%{value}*** is NOT INCLUDED IN THE TITLE."  }

end
