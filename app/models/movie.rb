class Movie < ApplicationRecord
has_many :bookmarks
has_many :movies

validates :title, presence: true, uniqueness: true
validates :overview, presence: true
validates :poster_url, presence: true
validates :rating, presence: true

end
