class ClickBait
  def validate(post)
    true if (["Won't Believe", "Secret", "Guess"].include? post.title) || (top_number? post.title)
  end

  def top_number?(title)
    true if /Top [0-9]+/.match(title)
  end
end
