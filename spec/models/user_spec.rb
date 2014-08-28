require 'spec_helper'

RSpec.describe User, :type => :model do
  before { @user = User.new(name: "example_user", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:meetups) }
  it { should respond_to(:attendances) }
  it { should respond_to(:attend_meetups) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:followers) }
  it { should respond_to(:relationships) }
  it { should respond_to(:reverse_relationships) }

  it { should respond_to(:attend_meetup!) }
  it { should respond_to(:cancel_meetup!) }
  it { should respond_to(:attend_meetup?) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) }

  it { should be_valid }

  # ----- validation -----
  ## ----- name validation -----

  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when the name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "with too long name" do
    before { @user.name = 'a' * 141 }
    it { should_not be_valid }
  end

  ## ----- email validation -----

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      address = %w[user@foo,com user_at_foo.org example.user@goo.goo@bar_baz.com goo@bar+baz.com]
      address.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  ## ----- password validation -----
  
  describe "with too short password" do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should_not be_valid }
  end

  # spec

  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    it { @user.followed_users.should include(other_user) }

    describe "followed user" do
      subject { other_user }
      it { other_user.followers.should include(@user) }
    end

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      it { @user.followed_users.should_not include(other_user) }
    end
  end

end
