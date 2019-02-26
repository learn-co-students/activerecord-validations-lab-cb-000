class Post < ActiveRecord::Base
  validates :title, presence: true


  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  #
  #
  # validates :name, uniqueness: true
  # validates :phone_number, uniqueness: true
end
