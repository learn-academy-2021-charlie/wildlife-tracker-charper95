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

# Story: As the consumer of the API I can update an animal sighting in the database.

# Story: As the consumer of the API I can destroy an animal sighting in the database.

# Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
Hint: Checkout the Ruby on Rails API docs on how to include associations.

# Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
Hint: Your controller can look like this:
