require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { build(:book) }

    it { should validate_presence_of(:publisher) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author_first_name) }
    it { should validate_presence_of(:author_last_name) }
    it { should validate_presence_of(:price) }
  end
end
