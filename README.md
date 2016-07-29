
# _EpiChatus_

#### RUBY Group Project
Ruby: Sinatra app running on Faye server for Epicodus 07.24.2016
## By Katarina Tuttle, Liam Ellis, Rony Nasr, and Sebastian Prokuski

### Online Path:
(https://agile-castle-57530.herokuapp.com)

## Description
This app allows a user to chat in near real-time with a forum of Epicodus students. Each user's information is saved in the database for later retrieval, and all passwords are encrypted. Future extensions of the program include person to person chat, and distinct chatrooms for different Epicodus classes.

## User Stories
* As a user, I want to be able to create a new account.
* As a user, I want to be able to login to my unique account with an email and password.
* As a user, I want to be able to view other users.
* As a user, I want to be able to add messages to the chatroom.
* As a user, I want to be able to view messages posted to the chatroom by classmates in near realtime.

## Setup
* Clone this repository
* browse into project folder
* Run _bundle_ in terminal
  * rake db:create
  * rake db:migrate
  * rake db:test:prepare
* run _heroku local web_ in terminal
* Go to _localhost:5000_ in your browser
* enter a text and click send
* in the terminal you should see the following

_[:open, 7612549]
127.0.0.1 - - [02/Oct/2016 17:16:26] "Get /favicon.ico HTTP/1.1" 404 490 0.0012
[:message, "{\"handle\":\"your name\",\"text\":\"your text\" }"]_

* push the project to Heroku
* run _heroku addons:create rediscloud_ in terminal
* run _heroku run rake db:migrate_  in terminal to install the database on heroku
* run _heroku open_ to run your app


## Database Specs
* Production Database: epichatus
* Development Database: epichatus_test
* Resource Names: users, messages, (conversations :POSTPONED)
* Attributes (users): email, password (encrypted), username, online?
* Attributes (messages): conversation_id, user_id, body
* Attributes (conversations :POSTPONED): id, message_id, sender_id, recipient_id

## Technologies
* Ruby
* Sinatra
* Rspec
* Capybara
* HTML
* Bootstrap
* Faye
* Heroku

## Legal
Copyright (c) 2016 **_{Team EpiChat}_**
