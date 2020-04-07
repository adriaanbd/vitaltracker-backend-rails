require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { build(:user) }
  let(:repeated_user) { build(:user) }
  describe 'associations' do
    it "has many vitals" do
      should have_many(:vitals).dependent(:destroy)
    end
  end

  describe 'validations' do
    it 'is valid with an username' do
      valid_user.valid?
      expect(valid_user.errors[:username]).to_not include("can't be blank");
    end

    it 'is not valid without an username' do
      valid_user.username = nil
      valid_user.valid?
      expect(valid_user.errors[:username]).to include("can't be blank");
    end

    it 'is not valid if username is not unique' do
      valid_user.save!
      repeated_user.valid?
      expect(repeated_user.errors[:username]). to include('has already been taken')
    end
  end
end
