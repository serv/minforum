require 'spec_helper'

describe "Forums" do
  
  subject { page }
  
  shared_examples_for "all pages" do
    describe "should have logo" do
      it { should have_selector('div.navbar-inner div.container a', text:'Minforum') }
    end
    
    describe "should have navigation header" do
      it { should have_selector('nav ul li a', text: 'Home') }
      it { should have_selector('nav ul li a', text: 'About') }
      it { should have_link('Home', href: root_path) }
      it { should have_link('About', href: 'https://github.com/serv/minforum') }
    end
    
    # describe "should have correct title" do
    #       it { should have_selector('title', text: full_title(title)) }
    #     end
    #     
    #     describe "should have correct heading" do
    #       it { should have_selector('h1', text: heading) }
    #     end
  end
  
  shared_examples_for "forum pages with a form" do
    describe "should have correct labels" do
      it { should have_selector('label', text: 'Name') }
      it { should have_selector('label', text: 'Description') }
    end
    
    describe "should have correct inputs" do
      it { should have_selector("input[id='forum_name'][name='forum[name]']#{form_name_content(form_name)}") }
      it { should have_selector("textarea[id='forum_description'][name='forum[description]']", text: form_description) }
    end
  
    describe "should have correct input button" do
      it { should have_selector("input[class='btn btn-large btn-primary'][name='commit']#{form_button_content(form_submit_button)}") }
    end
  end
  
  describe "Index forum page" do
    
    before { visit root_path }
    let(:title) {''}
    let(:heading) {'Forums'}
    
    describe "should have valid table headings" do
      it { should have_selector('table thead tr th', text: 'General Forums') }
      it { should have_selector('table thead tr th', text: 'Topics') }
      it { should have_selector('table thead tr th', text: 'Posts') }
      it { should have_selector('table thead tr th', text: 'Views') }
      it { should have_selector('table thead tr th', text: 'Settings') }
    end
  
    describe "should have \"New Forum\" button" do
      it { should have_selector('div.row div.span2 a', text: 'New Forum') }
      it { should have_link('New Forum', href: new_forum_path) }
    end
    
    it_should_behave_like 'all pages'
  end
  
  describe "New forum page" do
  
    before { visit new_forum_path }
    let(:title) {'Create a forum'}
    let(:heading) {'Create a forum'}
    
    describe "should have a correct form" do
      let(:form_name) {''}
      let(:form_description) {''}
      let(:form_submit_button) {'Create a forum'}
      
      # it_should_behave_like 'forum pages with a form'
    end
    
    describe "with valid information" do
      before do
        fill_in 'Name', with: 'Example Forum'
        fill_in 'Description', with: 'A few reminders'
      end
      
      # it "should be able to create a new forum" do
      #   expect do
      #     click_button 'Create a forum'
      #   end.to change(Forum, :count).by(1)
      # end
      
      # describe "after saving the forum" do
      #   before { click_button "Create a forum" }
      #   let(:forum) { Forum.find_by_name('Example Forum') }
      #   it { should have_selector('title', text: full_title(forum.name)) }
      # end
    end
    
    it_should_behave_like 'all pages'
  end
  
  # describe "Edit forum page" do
  #   
  #   let(:forum) { FactoryGirl.create(:forum) }
  #   before { visit edit_forum_path(forum) }
  #   let(:title) {'Edit the forum'}
  #   let(:heading) {'Edit the forum'}
  #   
  #   describe "should have a correct form" do
  #     let(:form_name) {forum.name}
  #     let(:form_description) {forum.description}
  #     let(:form_submit_button) {'Edit'}
  #     
  #     it_should_behave_like 'forum pages with a form'
  #   end
  #   
  #   describe "with valid information" do
  #     let(:new_name) { 'New example name' }
  #     let(:new_description) { 'A few reminders' }
  #     before do
  #       fill_in 'Name', with: new_name
  #       fill_in 'Description', with: new_description
  #       click_button 'Edit'
  #     end
  #     
  #     it { should have_selector('title', text: full_title('')) }
  #     specify { forum.reload.name.should == new_name }
  #     specify { forum.reload.description.should == new_description }
  #   end
  #   
  #   it_should_behave_like 'all pages'
  # end
  # still need to write delete forum function
end