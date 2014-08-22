require 'spec_helper'

describe Micropost do
  before do
    @user = FactoryGirl.create(:user)
    @micropost = @user.microposts.build(content: "user post.")
  end

  subject { @micropost }

  it { should respond_to(:user_id) }
  it { should respond_to(:content) }

  # ----- validation ------
  ## ----- user_id -----
  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  ## ----- content -----
  describe "when content is not prensent" do
    before { @micropost.content = nil }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @micropost.content = "a" * 141 }
    it { should_not be_valid }
  end
end
