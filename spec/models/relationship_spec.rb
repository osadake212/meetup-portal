require 'spec_helper'

describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  it { should respond_to(:follower_id) }
  it { should respond_to(:followed_id) }
  it { relationship.followed_id.should eq followed.id }
  it { relationship.follower_id.should eq follower.id }

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not prenset" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end
end
