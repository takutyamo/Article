class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :gossip

  validates :content, length: { maximum: 200 }
end
