class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with TitleValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end


# Alternative validation using EachValidator / validate_each
# see also app/validators/titlevalidator.rb

# class Post < ActiveRecord::Base
#   include ActiveModel::Validations
#   validates :title, presence: true, title: true
#   validates :content, length: { minimum: 250 }
#   validates :summary, length: { maximum: 250 }
#   validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
# end