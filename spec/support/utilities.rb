def full_title(page_title)
  base_title = 'Minforum'
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def form_name_content(form_name)
  form_name == '' ? '' : ""
end

def form_button_content(form_button)
  "[value='#{form_button}']"
end