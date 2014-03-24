# Cyclecity
Find Bike Parking in San Francisco

## Getting Started

**Dependencies:**
- Ruby 2
- Rails 4 `gem install rails`
- npm
- bower `npm install bower -g`
- karma `npm install karma -g`

```
git clone git@github.com:BenjaminCorey/cyclesity.git
cd cyclesity

bundle install
bower install

rake db:create # you may have to edit the database.yml to use your Postgres credentials

rake db:migrate
rake db:test:prepare

# Run the Rails Test Suite
guard

# Run the Javascript Test Suite
karma start
```

## Seeding the Database
Fetch the bicycle parking locations from the City database.
```
rake cyclesity:import_bike_parking_locations
```