class Snippet < ApplicationRecord
  belongs_to :user
  belongs_to :kind

  validates :kind, presence: true
  validates :title, presence: true, uniqueness: true
  validates :work, presence: true, length: { minimum: 5 }
end
