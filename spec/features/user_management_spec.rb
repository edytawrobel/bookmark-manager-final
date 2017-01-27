feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'wrong password confirmation raises error' do
    wrong_sign_up
    expect { wrong_sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'blank email field does not allow sign up' do
    no_email
    expect { no_email }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

  scenario 'malformed email does not alllow sign up' do
    wrong_email_format
    expect { wrong_email_format }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end

end
