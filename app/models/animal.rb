class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, presence: true
    validates :latin_name, presence: true
    validates :common_name, uniqueness: true
    validates :latin_name, uniqueness: true
end
