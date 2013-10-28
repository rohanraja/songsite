class SongItem < ActiveRecord::Base

	validates :path, presence: true
	validates :path, uniqueness: true

	validates :title , uniqueness: { scope: [:album, :artist] }


end
