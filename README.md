# Cyclesity
### Find Bike Parking in San Francisco
### Technical Track: Full Stack
### Demo: [http://cyclesity.herokuapp.com/](http://cyclesity.herokuapp.com/)

Cyclesity is a Rails app for locating Bike Parking in SF. It uses HTML5 geolocation to center the map when the page is first loaded (make sure to click 'Accept' when prompted). You can also search using the search box, and it will attempt to autocomplete the address you're typing using Google Places.

After searching, you can click on one of the displayed results and it will plot directions from your current location.


## Getting Started

**Dependencies:**
- Ruby 2
- Rails 4 `$ gem install rails`
- PostgreSQL
- npm
- bower `$ npm install bower -g`
- karma `$ npm install karma -g`

```
$ git clone git@github.com:BenjaminCorey/cyclesity.git
$ cd cyclesity

# install ruby dependencies
$ bundle install

# install frontend dependencies
$ bower install

# create the database
# you may have to edit the database.yml to use your Postgres credentials
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare

# Run the Rails Test Suite
$ guard

# Run the Javascript Test Suite
$ karma start

# Start the development server
$ rails server
```

#### Seeding the Database
Fetch the bicycle parking locations from the City database.
```
$ rake cyclesity:import_bike_parking_locations
```
