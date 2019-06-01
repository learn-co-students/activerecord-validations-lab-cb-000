class PostValidator < ActiveModel::Validator
    def validate(record)
        click_bait = ["Won't Believe", "Guess",
        "Secret", "Top 10", "Top 5"]

        click_bait.each do |phrase| 
            if record.title.starts_with? phrase
                "false"
            end
        end 
    end
end