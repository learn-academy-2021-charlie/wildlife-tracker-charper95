require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without date' do
    sighting = Sighting.create latitude: '0° 48′ 0″ N', longitude: '14° 55′ 59.88″ E'
    expect(sighting.errors[:date]).to_not be_empty
  end
  it 'is not valid without latitude' do
    sighting = Sighting.create date: '2005-04-12 11:30:00', longitude: '14° 55′ 59.88″ E'
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it 'is not valid without longitude' do
    sighting = Sighting.create date: '2005-04-12 11:30:00',  latitude: '0° 48′ 0″ N'
    expect(sighting.errors[:longitude]).to_not be_empty
  end
end
