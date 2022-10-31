class User < ApplicationRecord
    has_and_belongs_to_many :songs
    has_many :artists, :through => :songs
    has_many :albums, :through => :songs
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
