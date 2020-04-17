require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Require validations' do
    it 'should has a title' do
      should validate_presence_of(:title)
    end

    it 'should has a body' do
      should validate_presence_of(:body)
    end

    it 'should has a author_id' do
      should validate_presence_of(:author_id)
    end
  end

  describe 'Has associations' do
    it 'belongs to author' do
      should belong_to :author
    end
    it 'has many comments' do
      should have_many :comments
    end
  end
end
