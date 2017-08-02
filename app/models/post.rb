class Post < ActiveRecord::Base
  validates :title , :presence => true
  validates :content, :length => {:minimum => 250}
  validates :summary, :length => {:maximum => 250}
  validates :category, :inclusion => {:in => %w{Fiction Non-Fiction}}

  validate :validate_title

  def validate_title
    if self.title
      if !self.title.match(/Won't Believe|Secret|Top[0-9]/)
        errors.add(:title, "Invalid title content")
      end
    end
  end

end
