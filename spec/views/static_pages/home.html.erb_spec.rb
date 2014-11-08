require 'spec_helper'

describe "HomePages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  before { visit root_path }

  # ----- for sign in users -----
  describe "for sign in users" do
    before do
      sign_in user
      visit root_path
    end

    it { should have_link('Sign out') }
    it { should_not have_link('Sign in') }
  end

  # ----- for sign out users -----
  describe "for sign out users" do
    it { should have_link('Sign up') }
    it { should have_link('Sign in') }
    it { should_not have_link('Sign out') }
  end

  # ----- meetups -----
  describe "meetups" do

    describe "display limit" do
      before do
        11.times { FactoryGirl.create(:meetup, user: user) }
        visit root_path
      end

      it { should have_selector('dd.short-meetup-title', count: 5) }
    end
  end

  # ----- microposts -----
  describe "microposts" do
    before do
      21.times { FactoryGirl.create(:micropost, user: user) }
      visit root_path
    end

    describe "display limit" do
      it { should have_selector('li.micropost', count: 10) }
    end
  end
end
