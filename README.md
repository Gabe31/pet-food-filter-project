# README

Pet Food Filter is designed to allow users to generate the pet food brand they're familiar with and create a review for it. Users can also find reviews created by other users and see their reviews for that product.

Pet Food Filter uses Ruby 2.6.1, rails, sqlite3, bcrypt, omniauth, and a number of other gems. The app allows users to create a login, login with their existing name, or use omniauth to access their google login. 

The database has 3 tables: User, Pet Foods, and Reviews. Reviews is a join table that has a foreign key for both Pet Foods and Users. 

You will also notice the nested route in the config folder under routes:
  resources :pet_foods do 
    resources :reviews


