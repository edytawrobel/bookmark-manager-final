require 'spec_helper'

feature 'filtering by tags' do
  scenario 'User can filter by tags' do
    create_and_tag
    click_button('Filter tags')
    fill_in 'Search tags', :with => 'Social Media'
    click_button('Search Link')
    expect(page).to have_content('Social Media')
  end
end
