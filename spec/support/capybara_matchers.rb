module Features
  def have_button_with_text(text)
    have_css("input[value='#{text}']")
  end
end
