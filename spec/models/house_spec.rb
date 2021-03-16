require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:rooms) }
    it { is_expected.to validate_presence_of(:sqmt) }
    it { is_expected.to validate_presence_of(:floors) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
