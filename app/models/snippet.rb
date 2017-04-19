class Snippet < ApplicationRecord
  belongs_to :user

  validates :kind, presence: true
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: minimum: 5
end
