class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, presence: true
    validates :latin_name, presence: true
    validates :common_name, uniqueness: true
    validates :latin_name, uniqueness: true
    validate :name_checker
    def name_checker
        if common_name == latin_name
            errors.add(:common_name, 'cant be the same as latin_name')
        end
    end
end

