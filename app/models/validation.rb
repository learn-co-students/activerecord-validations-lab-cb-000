class PostValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ 
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
