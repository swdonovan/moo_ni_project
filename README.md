# README

Iteration 1:
  Companies CRUD
    - will have (name, city, state)
  Residence CRUD
    - will have (lot_name)
  Users CRUD
    - will have (name, email, password_digest)
  Sessions
    - create model and controller
  Routes
    - map logic with regards to scoping and authorization

Iteration 2:
  Transactions
    - will have (company_id, date, transaction_type, price, receipt) # will add column for cow reference
  Feeder Cows
    - will have (tag_number, residence_id, image_path)
  Calving Cows
    - will have (tag_number, residence_id, image_path)
  Feeder Cows Weights Table
    - will have (feeder_cow_id, weight, weigh_method)
  Calving Cows Weights Table     
    - will have (calving_cow_id, weight, weigh_method)

Iteration 3:
  Views(HTML/CSS?Bootstrap)
  Analytics
    - admin (related to transactions)
    - user (specific to cows/weights)

Iteration 4:
  Extensions
  API



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
