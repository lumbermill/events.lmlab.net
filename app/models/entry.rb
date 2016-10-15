class Entry < ActiveRecord::Base
  belongs_to :event

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name,  presence: true

  scope :active, -> { where active: true }
end
