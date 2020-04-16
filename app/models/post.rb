# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_taggable
  # belongs_to :author, class_name: "user", foreign_key: "author_id"
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy

  scope :recent, -> { where('created_at <= :hour24', hour24: Time.now - 24.hours) }
end
