require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }

    let(:profile1) { create :profile, first_name: "Sander" }
    let(:profile2) { create :profile, first_name: "Stefan" }
    let(:profile3) { create :profile, first_name: "Wouter" }

    it "returns a sorted array of results that match" do
      expect(subject).to match_array [profile1, profile2]
      expect(subject).not_to include profile3
    end
  end

# Write tests for the one-to-one association between User and Profile.
  # describe "association with user" do
  #   let(:user) { create :user }
  #   let!(:profile) { create :profile, user: user }
  #
  #   it "belongs to user" do
  #     profile1 = user.profile.new(first_name: "Wonderful", last_name: "lablab", bio: "some sentences should be here")
  #
  #     expect(user.profile).to include(profile1)
  #   end
  #
  #   it "deletes associated user" do
  #     expect { user.destroy }.to change(Profile, :count).by(-1)
  #   end
  # end
end
