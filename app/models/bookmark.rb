class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, uniqueness: { scope: [:movie_id, :list_id] }
end
