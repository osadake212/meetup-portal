require 'spec_helper'

RSpec.describe Meetup, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
    @meetup = @user.meetups.build(title: "Sample Meetup", short_description: "Sample Meetups's Short Description", description: "Sample Meetup's description.", start_date: DateTime.now, end_date: DateTime.now)
  end

  subject { @meetup }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:short_description) }
  it { should respond_to(:description) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:user) }
  it { should respond_to(:attendances) }
  it { should respond_to(:attend_users) }

  # ----- validation -----
  ## ----- user_id -----
  describe "when user_id is not present" do
    before { @meetup.user_id = nil }
    it { should_not be_valid }
  end

  ## ----- title -----
  describe "when title is not present" do
    before { @meetup.title = "" }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @meetup.title = "a" * 51 }
    it { should_not be_valid }
  end

  ## ----- short description ----
  describe "whne short description is not present" do
    before { @meetup.short_description = "" }
    it { should_not be_valid }
  end

  describe "when short description is too long" do
    before { @meetup.short_description = "a" * 101 }
    it { should_not be_valid }
  end

  ## ----- description -----
  describe "when description is too long" do
    before { @meetup.description = "a" * 1001 }
    it { should_not be_valid }
  end

  ## ----- start_date -----
  describe "when start_date is not present" do
    before { @meetup.start_date = nil }
    it { should_not be_valid }
  end

  ## ----- end_date -----
  describe "when end_date is not present" do
    before { @meetup.end_date = nil }
    it { should_not be_valid }
  end
end
