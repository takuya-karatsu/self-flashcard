class String
  def reflect_newline
    return gsub(/\r\n|\r|\n/, "<br />").html_safe
  end
end