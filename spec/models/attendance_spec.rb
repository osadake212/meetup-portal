require 'spec_helper'

describe Attendance do

  let(:user) { FactoryGirl.create(:user) }
  let(:meetup) do
    meetup = user.meetups.build(title: "Sample Meetup", short_description: "Sample Meetups's Short Description",description: "Sample Meetup's description.", start_date: DateTime.now, end_date: DateTime.now)
    meetup.save
    meetup
  end
  let(:attendance) { user.attendances.build(meetup_id: meetup.id) }

  subject { attendance }

  it { should be_valid }
end
