require 'spec_helper'

describe Attendance do

  let(:user) { FactoryGirl.create(:user) }
  let(:meetup) do
    meetup = user.meetups.build(title: "Sample Meetup", short_description: "Sample Meetups's Short Description",description: "Sample Meetup's description.", start_date: DateTime.now + 1.hour, end_date: DateTime.now + 2.hour)
    meetup.save
    meetup
  end
  let(:attendance) { user.attendances.build(meetup_id: meetup.id) }

  subject { attendance }

  it { should be_valid }
  it { should respond_to(:user_id) }
  it { should respond_to(:meetup_id) }
  it { attendance.user_id.should eq user.id }
  it { attendance.meetup_id.should eq meetup.id }

  # ----- validation -----
  ## ----- user_id -----
  describe "when user_id is not present" do
    before { attendance.user_id = nil }
    it { should_not be_valid }
  end

  ## ----- meetup_id -----
  describe "when meetup_id is not present" do
    before { attendance.meetup_id = nil }
    it { should_not be_valid }
  end
end
