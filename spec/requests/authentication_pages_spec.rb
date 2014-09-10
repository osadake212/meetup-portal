require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  # ----- Sign in page -----
  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
  end

  # ----- sign in -----
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      # sign in with blank information
      before { click_button "Sign in" }

      it { should have_content('Sign in') }
      it { should have_selector('div.alert.alert-warning', text: 'Invalid') }
    
      describe "after visiting another page" do
        before { click_link "Portal" }
        it { should_not have_selector("div.alert.alert-warning") }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out'), href: signout_path }
      it { should_not have_link('Sign in'), href: signin_path }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end
end
