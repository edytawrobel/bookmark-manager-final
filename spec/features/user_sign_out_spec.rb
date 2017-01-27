feature 'User sign out' do

  let(:user) do
    User.create(email: 'tom@example.com',
                password: 'dogs2017',
                password_confirmation: 'dogs2017')
  end

  scenario 'while being signed in' do
    sign_in(email: 'tom@example.com', password: 'dogs2017')
    click_button 'Sign out'
    expect(page).to have_content "See you soon!"
    expect(page).not_to have_content "Welcome, #{user.email}"
  end

end
