require 'spec_helper'

RSpec.describe Meetup, :type => :model do
  before do
    @user = User.new(name: "example_user", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @meetup = Meetup.new(user_id: @user.id, title: "OSD Meetup", description: "osada's meetup", format: "hands on", date: DateTime.now.to_date, start_time: Time.now, end_time: Time.now)
  end

  subject { @meetup }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:format) }
  it { should respond_to(:date) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:user) }

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

  ## ----- description -----
  describe "when description is too long" do
    before { @meetup.description = "a" * 1001 }
    it { should_not be_valid }
  end

  ## ----- format -----
  describe "when format is not present" do
    before { @meetup.format = "" }
    it { should_not be_valid }
  end

  describe "when format is too long" do
    before { @meetup.format = "a" * 51 }
    it { should_not be_valid }
  end

  ## ----- date -----
  describe "when date is not present" do
    before { @meetup.date = nil }
    it { should_not be_valid }
  end
end
