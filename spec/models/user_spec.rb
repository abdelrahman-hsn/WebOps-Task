require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'Require validations' do
    it 'should has a email' do
      should validate_presence_of(:email)
    end
  end

  describe 'Has associations' do
    it 'has many comments' do
      should have_many :comments
    end

    it 'has many posts' do
      should have_many :posts
    end
  end
end
