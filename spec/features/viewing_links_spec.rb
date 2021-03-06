require 'spec_helper'
require './app/models/link'

feature "view list of links" do
  scenario "User can view a list of links on the homepage" do
    Link.create(url: 'http://www.makersacademy.com' , title: 'Makers Academy')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
