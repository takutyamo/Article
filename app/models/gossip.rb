class Gossip < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_rich_text :content

    validates :title, length: { maximum: 50 } ,presence: true
end
