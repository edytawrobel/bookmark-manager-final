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
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
