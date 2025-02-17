class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :movie_id, presence: true
  validates :list_id, presence: true
end
