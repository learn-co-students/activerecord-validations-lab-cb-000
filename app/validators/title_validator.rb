class TitleValidator < ActiveModel::Validator

  def validate(record)
    if record.title
      unless record.title.match?(/Won't Believe|Secret|Guess|Top \d+/)
      record.errors[:title] << "Title is not clickbaity enough!"
      end
    end
  end

end


#  alternative validator using EachValidator
#  also see comments in post.rb

# class TitleValidator < ActiveModel::EachValidator
# 
#   def validate_each(record, attribute, value)
#     if value
#       unless value.include?("Won't Believe")
#         record.errors[attribute] << "Title is not clickbaity enough!"
#       end
#     end
#   end
#
# end