require 'spec_helper'

describe "Forums" do
  
  subject { page }
  
  shared_examples_for "all forum pages" do
    describe "should have logo" do
      it { should have_selector('div.navbar-inner div.container a', text:'Minforum') }
    end
    
    describe "should have navigation header" do
      it { should have_selector('nav ul li a', text: 'Home') }
      it { should have_selector('nav ul li a', text: 'About') }
      it { should have_link('Home', href: root_path) }
      it { should have_link('About', href: 'https://github.com/serv/minforum') }
    end
    
    describe "should have correct title" do
      it { should have_selector('title', text: forum_title(title)) }
    end
  end
  
  describe "Index forum page" do
    
    before { visit root_path }
    
    let(:title) {''}
    
    it { should have_selector('h1', text: 'Forums') }
    
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
    
    it_should_behave_like 'all forum pages'
  end
  
  describe "New forum page" do
  
    before { visit new_forum_path }
    
    let(:title) {'Create a forum'}
    
    describe "should have a correct heading" do
      it { should have_selector('h1', text: 'Create a forum') }
    end
    
    describe "should have a correct form" do
      
      describe "should have correct labels" do
        it { should have_selector('label', text: 'Name') }
        it { should have_selector('label', text: 'Description') }
      end
    
      describe "should have correct inputs" do
        it { should have_selector("input[id='forum_name'][name='forum[name]']") }
        it { should have_selector("textarea[id='forum_description'][name='forum[description]']") }
      end
    
      describe "should have correct input button" do
        it { should have_selector("input[class='btn btn-large btn-primary'][name='commit']") }
      end
      
    end
    
    it_should_behave_like 'all forum pages'
  end

end