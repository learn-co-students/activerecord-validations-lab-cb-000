class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end


# All authors have a name
# No two authors have the same name
# Author phone numbers are exactly ten digits
