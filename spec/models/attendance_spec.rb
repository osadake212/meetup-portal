require 'spec_helper'

describe Attendance do

  let(:user) { FactoryGirl.create(:user) }
  let(:meetup) do
    meetup = user.meetups.build(title: "Sample Meetup", description: "Sample Meetup's description.", format: "hands on", date: DateTime.now.to_date, start_time: Time.now, end_time: Time.now)
    meetup.save
    meetup
  end
  let(:attendance) { user.attendances.build(meetup_id: meetup.id) }

  subject { attendance }

  it { should be_valid }
end