class Author < ActiveRecord::Base

  # validate in the model, as it defines how each instance ought to behave in the db
  # name: validate: :presence = true

  validates :name, presence: true , uniqueness: true
  validates :phone_number, length: { minimum: 10 }

end
