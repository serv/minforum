require 'spec_helper'

describe 'Topics' do
  
  subject { page }
  let(:forum) { FactoryGirl.create(:forum) }
  
  describe 'Index topic page' do
    
    before { visit forum_topics_path(forum) }
    let(:title) { forum.name }
    let(:heading) { forum.name }

    describe "should have valid table headings" do
      it { should have_selector('table thead tr th', text: 'Topics') }
      it { should have_selector('table thead tr th', text: 'Last Post') }
      it { should have_selector('table thead tr th', text: 'Replies') }
      it { should have_selector('table thead tr th', text: 'Views') }
      it { should have_selector('table thead tr th', text: 'Settings') }
    end
    
    describe "should have \"New Forum\" button" do
      it { should have_selector('div.row div.span2 a', text: 'New Topic') }
      it { should have_link('New Topic', href: new_forum_topic_path(forum)) }
    end

    it_should_behave_like 'all pages'
  end
  
end