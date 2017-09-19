class Song < ActiveRecord::Base
    has_many :playlists, dependent: :destroy
    has_many :added_by, through: :playlists, source: :user

    validates :artist, :title, presence: true, length: 2..30
    validates_format_of :artist, :title, with: /\A[-a-z ]+\Z/i

    def downcase_fields 
        self.artist.downcase!
        self.title.downcase!
    end
end
