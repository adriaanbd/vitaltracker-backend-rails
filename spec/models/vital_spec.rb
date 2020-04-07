require 'rails_helper'

RSpec.describe Vital, type: :model do
  let(:valid_vital) { build(:vital) }
  describe 'associations' do
    it "should belong to a user" do
      should belong_to(:user)
    end
  end

  describe 'validations' do
    it 'is valid with a measure attribute' do
      valid_vital.valid?
      expect(valid_vital.errors[:measure]).to_not include("can't be blank");
    end

    it 'is not valid without a measure attribute' do
      valid_vital.measure = nil
      valid_vital.valid?
      expect(valid_vital.errors[:measure]).to include("can't be blank");
    end
  end
end
