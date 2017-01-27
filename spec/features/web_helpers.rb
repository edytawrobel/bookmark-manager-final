def create_link
  visit 'links/new'
  fill_in :title, :with => "MySpace"
  fill_in :url, :with => "myspace.com"
  click_button 'Create Link'
end

def create_and_tag
  visit 'links/new'
  fill_in :title, :with => "MySpace"
  fill_in :url, :with => "myspace.com"
  fill_in :tags, :with => "Social Media"
  click_button 'Create Link'
end

def sign_up
  visit '/users/new'
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def wrong_sign_up
  visit '/users/new'
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'wrong'
  click_button 'Sign up'
end

def no_email
  visit '/users/new'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def wrong_email_format
  visit '/users/new'
  fill_in :email,    with: 'aliceexample.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def sign_up_with_same_address
  sign_up
  sign_up
end

def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end
