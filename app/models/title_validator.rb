class TitleValidator < ActiveModel::EachValidator
  def validate_each(record,attribute, value)
     unless !!value && (value.include?("Won't Believe") || value.include?("Secret") || value.include?("Top") || value.include?("Guess")) 
        record.errors[:attribute] << (options[:message] ||  "Not a valid title." )
      end
    end


end
