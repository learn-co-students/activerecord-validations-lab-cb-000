class TitleValidator < ActiveModel::Validator

  def validate(record)
    unless record.title.empty? || record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Guess") || record.title.include?("Top [number]" )
      record.errors[:title]<< "Not appropriate title"
    end
  end
end
