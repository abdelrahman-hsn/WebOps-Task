require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Require validations' do
    it 'should has a comment' do
      should validate_presence_of(:comment)
    end

    it 'should has a post_id' do
      should validate_presence_of(:post_id)
    end

    it 'should has a user_id ' do
      should validate_presence_of(:user_id)
    end
  end

  describe 'Has associations' do
    it 'belongs to post' do
      should belong_to :post
    end

    it 'belongs to user' do
      should belong_to :user
    end
  end
end
