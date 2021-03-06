# Rails Bolderer Web Application

## Overview
This Rails-based app is designed by jacqueline-lam, as a Rails porfolio project for the Flatiron School Software Engineering cirriculum.

The app provides aspiring boulderers with the opprounity to browse problems set in the indoor climbing gym, keep track of their sends, and cheer on others' climbing progress as well!

![All Users Page](./public/images/rails-bolderer-app_all-users.png)
* [Blog Post](https://dev.to/jacquelinelam/ruby-on-rails-app-domain-with-many-to-many-relationships-3f5i)

## Features
* Login Page: Authentication system oAuth2 allows login from GitHub
* User Sends: User can sort their sends by difficulty, date and color
* User Sends: User can create a log by choosing an existing problem or creating a new problem
* All Problems: User can browse problems and see which users have sent a specific problem and read their log
* Validation Errors: Alert messages describing the validation failures will pop up if invalid form inputs or invalid URLs are entered

## Technologies Implemented
1. Ruby on Rails
2. Ruby Gem BCrypt to secure users' data by encrypting their passwords
3. ActiveRecord Associations
4. RESTful architecture for CRUD actions
5. MVC design pattern
6. SQLite3 for data persistence
7. Omniauth for 3rd party authentication
8. HTML and customized Bootstrap CSS


## Installation
Download zip from my project repository: https://github.com/jacqueline-lam/rails-bolderer-app

Go to your terminal and change directory:

    $ cd rails-bolderer-app

If you don't have Ruby, please install Ruby version `ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin19]`.

 With Rubygems loaded, you can install all of Rails and its dependencies using the following command through the command line:

    $ gem install rails -v 6.0.2

Use the following command to make Rails executable available.

    $ rbenv rehash

More installation instructions can be found on the [Ruby on Rails Guide](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)

Once Ruby and Rails are installed, run:

    $ gem install bundler


Bundler gem provides us access to a terminal command: `bundle install`

Install the gems and gem dependencies for this app by running:

    $ bundle install

And then run:

    $ rake db:seed

And then run:

    $ rails s

Lastly, go to http://localhost:3000 to browse the website on the local server.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jacqueline-lam/rails-bolderer-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Authors
Jacqueline Lam - @jacqueline-lam

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebases is expected to follow the [code of conduct](https://github.com/jacqueline-lam/bolderer_sinatra_app/blob/master/CODE_OF_CONDUCT.md).



