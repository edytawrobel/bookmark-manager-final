require 'spec_helper'

feature 'adding tags' do
  scenario 'User can add a tag to their saved website' do
    create_and_tag
    # within 'ul#links' do
    link = Link.first
    expect(link.tags.map(&:tags)).to include ('Social Media')
  # end
  end

  scenario 'User can add more than one tag to their saved website' do
    visit 'links/new'
    fill_in :title, :with => "SocialBubble"
    fill_in :url, :with => "socialbubble.com"
    fill_in :tags, :with => "social, bubbles"
    click_button 'Create Link'
    link = Link.first
    p link.tags.map(&:tags)
    expect(link.tags.map(&:tags)).to include ('social')
    expect(link.tags.map(&:tags)).to include ('bubbles')
  end
end
