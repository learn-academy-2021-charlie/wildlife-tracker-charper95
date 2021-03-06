# README

The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go-ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.

# Story: As a developer I can create an animal model in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).

$ rails g resource Animal common_name:string latin_name:string kingdom:string

# Story: As the consumer of the API I can see all the animals in the database.
Hint: Make a few animals using Rails Console

Animal.create common_name: 'Lion', latin_name: 'Panthera leo', kingdom: 'Animalia'
Animal.create common_name: 'Axolotl', latin_name: 'Ambystoma mexicanum', kingdom: 'Animalia'
Animal.create common_name: 'Fly agaric', latin_name: 'Amanita muscaria', kingdom: 'Fungi'
Animal.create common_name: 'Sunflower', latin_name: 'Helianthus', kingdom: 'Plantae'

Controller

    def index
        animal = Animal.all
        render json: animal
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal
    end

POSTMAN

GET localhost:3000/animals

[
    {
        "id": 1,
        "common_name": "Lion",
        "latin_name": "Panthera leo",
        "kingdom": "Animalia",
        "created_at": "2021-08-12T17:21:47.467Z",
        "updated_at": "2021-08-12T17:21:47.467Z"
    },
    {
        "id": 2,
        "common_name": "Axolotl",
        "latin_name": "Ambystoma mexicanum",
        "kingdom": "Animalia",
        "created_at": "2021-08-12T17:22:59.830Z",
        "updated_at": "2021-08-12T17:22:59.830Z"
    },
    {
        "id": 3,
        "common_name": "Fly agaric",
        "latin_name": "Amanita muscaria",
        "kingdom": "Fungi",
        "created_at": "2021-08-12T17:26:23.612Z",
        "updated_at": "2021-08-12T17:26:23.612Z"
    },
    {
        "id": 4,
        "common_name": "Sunflower",
        "latin_name": "Helianthus",
        "kingdom": "Plantae",
        "created_at": "2021-08-12T17:27:34.933Z",
        "updated_at": "2021-08-12T17:27:34.933Z"
    }
]

GET localhost:3000/animals/3

{
    "id": 3,
    "common_name": "Fly agaric",
    "latin_name": "Amanita muscaria",
    "kingdom": "Fungi",
    "created_at": "2021-08-12T17:26:23.612Z",
    "updated_at": "2021-08-12T17:26:23.612Z"
}

# Story: As the consumer of the API I can update an animal in the database.

Controller

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end

Application Controller

class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
end

POSTMAN

PATCH localhost:3000/animals/5

{
    "common_name": "Dog"
}

SEND

{
    "common_name": "Dog",
    "id": 5,
    "latin_name": "Canis lupus familiaris",
    "kingdom": "Animalia",
    "created_at": "2021-08-12T17:53:05.613Z",
    "updated_at": "2021-08-12T18:04:42.524Z"
}

# Story: As the consumer of the API I can destroy an animal in the database.

Controller

    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else 
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end

Application Controller

class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
end

POSTMAN

DELETE localhost:3000/animals/3

{
    "id": 3,
    "common_name": "Fly agaric",
    "latin_name": "Amanita muscaria",
    "kingdom": "Fungi",
    "created_at": "2021-08-12T17:26:23.612Z",
    "updated_at": "2021-08-12T17:26:23.612Z"
}

GET localhost:3000/animals

[
    {
        "id": 1,
        "common_name": "Lion",
        "latin_name": "Panthera leo",
        "kingdom": "Animalia",
        "created_at": "2021-08-12T17:21:47.467Z",
        "updated_at": "2021-08-12T17:21:47.467Z"
    },
    {
        "id": 2,
        "common_name": "Axolotl",
        "latin_name": "Ambystoma mexicanum",
        "kingdom": "Animalia",
        "created_at": "2021-08-12T17:22:59.830Z",
        "updated_at": "2021-08-12T17:22:59.830Z"
    },
    {
        "id": 4,
        "common_name": "Sunflower",
        "latin_name": "Helianthus",
        "kingdom": "Plantae",
        "created_at": "2021-08-12T17:27:34.933Z",
        "updated_at": "2021-08-12T17:27:34.933Z"
    },
    {
        "id": 5,
        "common_name": "Dog",
        "latin_name": "Canis lupus familiaris",
        "kingdom": "Animalia",
        "created_at": "2021-08-12T17:53:05.613Z",
        "updated_at": "2021-08-12T18:04:42.524Z"
    }
]

# Story: As the consumer of the API I can create a new animal in the database.

Controller

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal 
        else
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end

Application Controller

class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
end

POSTMAN

POST localhost:3000/animals

{
    "common_name": "Pug",
    "latin_name": "Canis lupus familiaris",
    "kingdom": "Animalia"
}

SEND

{
    "id": 5,
    "common_name": "Pug",
    "latin_name": "Canis lupus familiaris",
    "kingdom": "Animalia",
    "created_at": "2021-08-12T17:53:05.613Z",
    "updated_at": "2021-08-12T17:53:05.613Z"
}

# Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), a latitude, and a longitude.
Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)

$ rails g resource Sighting animal_id:integer date:datetime latitude:string longitude:string

$ rails db:migrate

$ rails c

lion = Animal.first
lion.sightings.create date: '2005-04-12 11:30:00',  latitude: '0?? 48??? 0??? N', longitude: '14?? 55??? 59.88??? E'

<Sighting id: 2, animal_id: 1, date: "2005-04-12 11:30:00.000000000 +0000", latitude: "0?? 48??? 0??? N", longitude: "14?? 55??? 59.88??? E", created_at: "2021-08-12 18:34:32.222540000 +0000", updated_at: "2021-08-12 18:34:32.222540000 +0000">

lion.sightings.create date: '2005-04-16 12:40:00',  latitude: '0?? 48??? 0??? N', longitude: '14?? 55??? 59.88??? E'

<Sighting id: 3, animal_id: 1, date: "2005-04-16 12:40:00.000000000 +0000", latitude: "0?? 48??? 0??? N", longitude: "14?? 55??? 59.88??? E", created_at: "2021-08-12 18:35:22.102020000 +0000", updated_at: "2021-08-12 18:35:22.102020000 +0000"> 

axolotl = Animal.find 2
axolotl.sightings.create date: '2021-08-12 11:36:00', latitude: '19?? 26??? 0??? N', longitude: '99?? 8??? 0??? W'

<Sighting id: 4, animal_id: 2, date: "2021-08-12 11:36:00.000000000 +0000", latitude: "19?? 26??? 0??? N", longitude: "99?? 8??? 0??? W", created_at: "2021-08-12 18:37:47.447389000 +0000", updated_at: "2021-08-12 18:37:47.447389000 +0000"> 

Controller

    def index
        sighting = Sighting.all
        render json: sighting
    end

    def show
        sighting = Sighting.find(params[:id])
        render json: sighting
    end

POSTMAN

GET localhost:3000/sightings

[
    {
        "id": 2,
        "animal_id": 1,
        "date": "2005-04-12T11:30:00.000Z",
        "latitude": "0?? 48??? 0??? N",
        "longitude": "14?? 55??? 59.88??? E",
        "created_at": "2021-08-12T18:34:32.222Z",
        "updated_at": "2021-08-12T18:34:32.222Z"
    },
    {
        "id": 3,
        "animal_id": 1,
        "date": "2005-04-16T12:40:00.000Z",
        "latitude": "0?? 48??? 0??? N",
        "longitude": "14?? 55??? 59.88??? E",
        "created_at": "2021-08-12T18:35:22.102Z",
        "updated_at": "2021-08-12T18:35:22.102Z"
    },
    {
        "id": 4,
        "animal_id": 2,
        "date": "2021-08-12T11:36:00.000Z",
        "latitude": "19?? 26??? 0??? N",
        "longitude": "99?? 8??? 0??? W",
        "created_at": "2021-08-12T18:37:47.447Z",
        "updated_at": "2021-08-12T18:37:47.447Z"
    }
]

GET localhost:3000/sightings/3

{
    "id": 3,
    "animal_id": 1,
    "date": "2005-04-16T12:40:00.000Z",
    "latitude": "0?? 48??? 0??? N",
    "longitude": "14?? 55??? 59.88??? E",
    "created_at": "2021-08-12T18:35:22.102Z",
    "updated_at": "2021-08-12T18:35:22.102Z"
}

# Story: As the consumer of the API I can update an animal sighting in the database.

Controller

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude)
    end

POSTMAN

PATCH localhost:3000/sightings/3

{
    "date": "2006-05-17 12:40:00"
}

{
    "date": "2006-05-17T12:40:00.000Z",
    "id": 3,
    "animal_id": 1,
    "latitude": "0?? 48??? 0??? N",
    "longitude": "14?? 55??? 59.88??? E",
    "created_at": "2021-08-12T18:35:22.102Z",
    "updated_at": "2021-08-12T18:52:26.667Z"
}

# Story: As the consumer of the API I can destroy an animal sighting in the database.

Controller

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else 
            render json: sighting.errors
        end
    end

POSTMAN

DELETE localhost:3000/sightings/3

{
    "id": 3,
    "animal_id": 1,
    "date": "2006-05-17T12:40:00.000Z",
    "latitude": "0?? 48??? 0??? N",
    "longitude": "14?? 55??? 59.88??? E",
    "created_at": "2021-08-12T18:35:22.102Z",
    "updated_at": "2021-08-12T18:52:26.667Z"
}

GET localhost:3000/sightings

[
    {
        "id": 2,
        "animal_id": 1,
        "date": "2005-04-12T11:30:00.000Z",
        "latitude": "0?? 48??? 0??? N",
        "longitude": "14?? 55??? 59.88??? E",
        "created_at": "2021-08-12T18:34:32.222Z",
        "updated_at": "2021-08-12T18:34:32.222Z"
    },
    {
        "id": 4,
        "animal_id": 2,
        "date": "2021-08-12T11:36:00.000Z",
        "latitude": "19?? 26??? 0??? N",
        "longitude": "99?? 8??? 0??? W",
        "created_at": "2021-08-12T18:37:47.447Z",
        "updated_at": "2021-08-12T18:37:47.447Z"
    }
]

# Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
Hint: Checkout the Ruby on Rails API docs on how to include associations.

Controller

    def show
        animal = Animal.find(params[:id])
        render json: animal.as_json(include: :sightings)
    end

POSTMAN 

GET localhost:3000/animals/1

{
    "id": 1,
    "common_name": "Lion",
    "latin_name": "Panthera leo",
    "kingdom": "Animalia",
    "created_at": "2021-08-12T17:21:47.467Z",
    "updated_at": "2021-08-12T17:21:47.467Z",
    "sightings": [
        {
            "id": 2,
            "animal_id": 1,
            "date": "2005-04-12T11:30:00.000Z",
            "latitude": "0?? 48??? 0??? N",
            "longitude": "14?? 55??? 59.88??? E",
            "created_at": "2021-08-12T18:34:32.222Z",
            "updated_at": "2021-08-12T18:34:32.222Z"
        }
    ]
}

# Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
Hint: Your controller can look like this:

class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end

Remember to add the start_date and end_date to what is permitted in your strong parameters method.

Controller

    def index
        sighting = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sighting
    end

    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude, :start_date, :end_date)
    end

POSTMAN

GET localhost:3000/sightings/

{
    "start_date": "2005-01-01",
    "end_date": "2006-01-01"
}

[
    {
        "id": 2,
        "animal_id": 1,
        "date": "2005-04-12T11:30:00.000Z",
        "latitude": "0?? 48??? 0??? N",
        "longitude": "14?? 55??? 59.88??? E",
        "created_at": "2021-08-12T18:34:32.222Z",
        "updated_at": "2021-08-12T18:34:32.222Z"
    }
]

## Stretch Challenges
# Note: All of these stories should include the proper RSpec tests. Validations will require specs in spec/models, and the controller method will require specs in spec/requests.

# Story: As the consumer of the API, I want to see validation errors if a sighting doesn't include: latitude, longitude, or a date.

Sighting Spec

require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without date' do
    sighting = Sighting.create latitude: '0?? 48??? 0??? N', longitude: '14?? 55??? 59.88??? E'
    expect(sighting.errors[:date]).to_not be_empty
  end
  it 'is not valid without latitude' do
    sighting = Sighting.create date: '2005-04-12 11:30:00', longitude: '14?? 55??? 59.88??? E'
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it 'is not valid without longitude' do
    sighting = Sighting.create date: '2005-04-12 11:30:00',  latitude: '0?? 48??? 0??? N'
    expect(sighting.errors[:longitude]).to_not be_empty
  end
end

Sighting Model

class Sighting < ApplicationRecord
    belongs_to :animal
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :date, presence: true
end

# Story: As the consumer of the API, I want to see validation errors if an animal doesn't include a common name, or a latin name.

Animal Spec

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
end

Animal Model

class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, presence: true
    validates :latin_name, presence: true
end

# Story: As the consumer of the API, I want to see a validation error if the animals latin name matches exactly the common name.

Animal Spec

  it 'is not valid if the common name and latin name are the same' do
    animal = Animal.create common_name: 'Lion', latin_name: 'Lion', kingdom: 'Animalia'
    expect(animal.errors[:common_name]).to_not be_empty
  end

Animal Model

class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, presence: true
    validates :latin_name, presence: true
    validate :name_checker
    def name_checker
        if common_name == latin_name
            errors.add(:common_name, 'cant be the same as latin_name')
        end
    end
end

# Story: As the consumer of the API, I want to see a validation error if the animals latin name or common name are not unique.

Animal Spec

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

Animal Model

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

## Super Stretch Challenge
# Story: As the consumer of the API, I can submit sighting data along with a new animal in a single API call.
Hint: Look into accepts_nested_attributes_for

Last Story Worked On
