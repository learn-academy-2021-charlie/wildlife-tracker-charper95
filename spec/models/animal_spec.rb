require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without common name' do
    animal = Animal.create latin_name: 'Panthera leo', kingdom: 'Animalia'
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid without latin name' do
    animal = Animal.create common_name: 'Lion', kingdom: 'Animalia'
    expect(animal.errors[:latin_name]).to_not be_empty
  end
  it 'is not valid if the common name and latin name are the same' do
    animal = Animal.create common_name: 'Lion', latin_name: 'Lion', kingdom: 'Animalia'
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if the common name is not unique' do
    animal = Animal.create common_name: 'Lion', latin_name: 'Leo', kingdom: 'Animalia'
    animal2 = Animal.create common_name: 'Lion', latin_name: 'random', kingdom: 'random'
    expect(animal2.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if the latin name is not unique' do
    animal = Animal.create common_name: 'Lion', latin_name: 'Leo', kingdom: 'Animalia'
    animal2 = Animal.create common_name: 'random', latin_name: 'Leo', kingdom: 'random'
    expect(animal2.errors[:latin_name]).to_not be_empty
  end
end
