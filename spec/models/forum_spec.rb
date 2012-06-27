require 'spec_helper'

describe Forum do

  let(:user) { FactoryGirl.create(:user) }
  before {@forum = user.forums.build(name:"Tempo", description: "Wicked forum")}

  subject { @forum }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @forum.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Forum.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when user_id is not present" do
    before { @forum.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank name" do
    before { @forum.name = " " }
    it { should_not be_valid }
  end
  
  describe "with name that is too long" do
    before { @forum.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @forum.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @forum.description = "a" * 501 }
    it { should_not be_valid }
  end
end