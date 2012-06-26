def full_title(page_title)
  base_title = 'Minforum'
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def form_name_content(form_name)
  form_name == '' ? '' : "[value='#{form_name}']"
end

def form_button_content(form_button)
  "[value='#{form_button}']"
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end