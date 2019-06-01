class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with PostValidator
    validates :title, presence: true
    # validates :content, length: { in: 0..500}
    # validates :summary, length: { maximum: 250 }
    # validates :category, inclusion: { in: %w( Fiction Non-Fiction )}
end
