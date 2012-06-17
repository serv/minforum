require 'spec_helper'

describe 'Topics' do

  shared_examples_for "topic pages with a form" do
    describe "should have correct labels" do
      it { should have_selector('label', text: 'Name') }
      it { should have_selector('label', text: 'Content') }
    end
    
    describe "should have correct inputs" do
      it { should have_selector("input[id='topic_name'][name='topic[name]']#{form_name_content(form_name)}") }
      it { should have_selector("textarea[id='topic_posts_attributes_0_content'][name='topic\[posts_attributes\]\[0\]\[content\]']", text: form_content) }
    end
  
    describe "should have correct input button" do
      it { should have_selector("input[class='btn btn-large btn-primary'][name='commit']#{form_button_content(form_submit_button)}") }
    end
  end
  
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
    
    describe "should have navigation" do
      it { should have_link('forum', href: root_path) }
    end

    it_should_behave_like 'all pages'
  end
  
  describe 'New topic page' do
  
    before { visit new_forum_topic_path(forum) }
    let(:title) { 'Create a topic' }
    let(:heading) { 'Create a topic' }

    describe "should have a correct form" do
      let(:form_name) {''}
      let(:form_content) {''}
      let(:form_submit_button) {'Create a topic'}
      
      it_should_behave_like 'topic pages with a form'
    end    
    
    it_should_behave_like 'all pages'
  end
  
  
end