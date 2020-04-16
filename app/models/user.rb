# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_secure_password
  mount_uploader :image, ImageUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
