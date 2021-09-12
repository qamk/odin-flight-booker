# Odin Flight Booker
This project was practise with populating a database with seed data, nested forms, nested routing (which I had already covered) and using a mailer to send the booking confirmation. As the name suggests, users can book tickets for up to 4 passengers at a time.

The app uses [Letter Opener](https://github.com/ryanb/letter_opener) so the booking confirmation mail is sent to the browser. Made in Rails 6.1. and styled with [Bulma](https://github.com/joshuajansen/bulma-rails).


## Using the app
To use the app, clone this repo using `git clone git@github.com:qamk/odin-flight-booker.git` and `cd odin-flight-booker` to enter the project directory.

Run `bundle install` to install the relevant gems.

Run the migrations with `bin/rails db:migrate` and the seeded data with `bin/rails db:seed`.
This will run the migrations (instructions on how to create the database) and load the database with seed data located in *./db/seeds.rb*.

Finally run the server with `rails s` or `rails server`.

## Resources
Some resources that I used when creating this project, and that may be useful generally, are:
- Creating Seed data
  - https://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html
- Giving a mailer view access to a helper module
  - https://stackoverflow.com/questions/4937208/access-helpers-from-mailer
    - e.g. how *views/passenger_mailer/\** have access to *ApplicationHelper* methods
  - To give the mailer class access to another helper's methods just `include [HelperModule]` in the mailer's class

## Discussion
This project was a good exercise in using seed data and setting up a mailer. There was nothing particularly difficult, but it was, as usual, a vehicle to learn different Rails features.
