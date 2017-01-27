require 'spec_helper'
require './app/models/link'

feature 'save a website' do
  scenario 'User can save the URL and title to the bookmark manager' do
    create_link

    expect(page.status_code).to eq 200

    expect(page).to have_content(:title)
  end
end
