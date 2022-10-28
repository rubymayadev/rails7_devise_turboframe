# Employment Test Project


## Requirements
- Ruby v3.1.0
- Rails 7.0.2
- MySQL v8.0.29

## Installation

Install the dependencies and devDependencies and bundle install to install all the required gems.

```sh
bundle install
```
Setup the database
```sh
./bin/rails db:setup
```
Run the server
```sh
./bin/dev
```

## Basic Usage

This app is built using Stimulus, Turbo, Slim, Rails. Tests of the app are written using Rspec.
App consists of two buttons:

- Personal Data
- Employment
    
Personal Data opens up a modal which consists of fields asking for your information. This modal takes up the information and on clicking save this information gets saved into the database.

Employment section is also a modal having fields related to employment details. One extra button in this modal is "Add another Employment". This button provides the oppourtunity to the user to add multiple employment details in the modal and save those multiple employements in the database using a single button click. Purpose of this section is to get employment information from the user and save that information in the database.
