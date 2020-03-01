class Author < ActiveRecord::Base
  # I am using active record to validate user input
  #is invalid with no name or a non -unique name
  #is invalid when the phone number is not the right length 
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { is: 10 }
end
