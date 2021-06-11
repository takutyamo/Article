class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar
    has_many :gossips, dependent: :destroy
    has_many :comments, dependent: :nullify

    validates :name, length: { maximum: 20 }
    validates :email, uniqueness: true, length: { maximum: 100 }
    validates :comment, length: { maximum: 200 }
end
