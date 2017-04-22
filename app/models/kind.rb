class Kind < ApplicationRecord
  validates :name, { presence: true, uniqueness: true }
  has_many :snippets
end
