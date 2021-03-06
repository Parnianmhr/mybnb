require 'rails_helper'

describe "shared/_navbar.html.erb" do
  before { login_as user }
  # Write an extra test for the navbar that checks if the log in and sign up links get rendered when the user is not signed in.
  context "with log in and sign up" do
    let(:user) { create :user }
    it "has in navbar" do
      visit root_url
      expect(page).to have_content('Log In')
    end
  end

  # before { sign_in user }
  #
  # context "without profile" do
  #   let(:user) { create :user }
  #
  #   it "renders email" do
  #     render
  #     expect(rendered).to have_content user.email
  #   end
  # end
  #
  # context "with profile" do
  #   let(:profile) { build :profile }
  #   let(:user) { create :user, profile: profile }
  #
  #   it "renders first and last name" do
  #     render
  #     expect(rendered).to have_content profile.first_name
  #     expect(rendered).to have_content profile.last_name
  #   end
  # end
end

# context "Home Page" do
#   it "shows login and sign up in navbar" do
#     # render
#     # visit root_url
#     expect(page).to have_content "Log in"
#   end
# end
