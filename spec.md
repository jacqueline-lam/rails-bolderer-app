# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
  - User has many Sends
  - Problem has many Sends
  - Problem has many ProblemStyles
  - Style has many ProblemStyles
  - Wall has many problems
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - ProblemStyle belongs to Problem
  - ProblemStyle belongs to Style
  - Problem belongs to Wall
  - Send belongs to User
  - Send belongs to Problem
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - User has many Problems through Sends
    - Problem has many Users through Sends
    - Problem has many Styles through ProblemStyles
    - Style has many Problems through ProblemStyles
- [x] Include at least one xmany-to-many relationship ( has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - User and Problems through Sends
  - Problem and Style through ProblemStyles
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - Send - attributes including attempts, date_sent, and image
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - Model objects: User (name and password must exit and match db), ProblemStyle must have unique problem_id, Problem (name, color, grade), Send (user_id, date_sent, unique problem_id, attempts > 0, date_sent to be set after problem created_at date)
  - Authroization helper methods built in controllers to avoid URL hacking
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Integrated GitHub Authentication with Omniauth 
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - users/:user_id/sends
  - users/:user_id/sends/:id/show
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - users/:user_id/sends/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - views/errors partial to display all validation errors new creating new problems, new users, and new sends. 
Confirm:
- [X] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

# Blog post
URL: 

---
# Additional Notes:

## Feature requests
* Scope method: filter Problem by problem.grade, style.name, problem.date (problems_sent_this_month)
  * format problem creation date by "Month, year"
* Model method: 
  * Problems: sort_by_date, sort_by_grade, convert_grade_to_number
  * Users: hardest_send, sort_user_sends_by_date, (maybe: self.best_climber, best_climber)
  * (Maybe) return points of a User based on sum of all the problems' points they earned this month?
  
* View helper method: convert style array into a string
  * format_timestamp_to_set_date
* Helper method: 

* Nested resources: 
  * users/:id/rewards (all rewards available) and users/:id/rewards/new (admin to create new reward options to user)
  * user/:id/problems ('problems#index')
  * user/:id/problems/new ('problems#new')
  * users/:id/problems/:id/comments/new ('comments#new')


## Users (Authentication)
### Sessionscontroller
* to handle login and logout
### actions
* new
* create
### UsersController 
* to handle signup (creating a user account)
### actions
* new
* create
* index -> leaderboard
* show -> show problems, rewards
** if you are owner of problem, you can see <%= link_to 'Edit problem', 'problems#edit' %>
** if you are other users, you can see <%= link_to 'Write a comment', 'comments#new' %>
### views
* signup form
* login form
### routes
* get '/users', to: 'users#index' 
* get '/users/show', to: 'users#show' #=> would show number of sends and points, link_to "see all their problems", /users/:id/problems
* get '/users/new', to: 'users#new'
* post'/users', to: 'users#create'
* get '/login', to 'sessions#new'
* post '/login', to 'sessions#create'
* get '/logout', to 'sessions#destroy'
### validations
* username (presence + uniqueness)
* password (presence)
* password must match password_confirmation
### Acess policy
* users who haven't signed in are not permitted to access any views except for application/index 
* users signed in can view problems, users, users/:user_id/sends and create/update/destroy their own sends 

### authroization / helper methods in controllers
* `before_action :require_login` filters halt the request cycle - requires that a user is logged in for an action to be run
*   `before_action :validate_user, only: [:show]`
* `before_action :require_logout, only: [:new, :create]`


## Problems
### controller
* index (by everyone)
* new
* show
* create
### routes
* get '/problems', to: 'problems#index'
* post 'problems/:id', to: 'problems#show' #=> display user_sends logs of this problem
* get 'problems/new', to: 'problems#new' 
* post 'problems', to: 'problems#create' 
### helpers
* instance method to sort_by_date
* view method: format_timestamp_to_set_date ('Month, Year') 
### validations
* name
* color
* grade
* style 
### authorization
* cannot access non-existant problem with '/problems/:id' -> redirect_to problems_path
* Must be logged in to see any problems: `before_action :require_login`



## Sends
### controller
* index (by everyone)
* new
* show
* create
* edit
* update
* destroy
### routes (all 7)
* get '/users/:id/sends', to: 'sends#index'
* post '/users/:id/sends/:id', to: 'sends#show' 
* get '/users/:id/sends/new', to: 'sends#new' 
* post '/users/:id/sends', to: 'sends#create' 
* get '/users/:id/sends/:id/edit', to: 'sends#edit' 
* patch '/users/:id/sends/:id', to: 'sends#update' 
* delete '/users/:id/sends/:id', to: 'sends#destroy' 
### helpers
* instance method
* view method: display_flash_attempt (if attempt == 1, display 'flash ⚡' in view) 
*  `before_action :get_user, only:[:index, :show, :new, :create, :hardest, :easiest]`
*  `before_action :get_send, only:[:show, :update, :destroy]`
### validations
*  `validates_presence_of :user_id, :date_sent`
* `validates :problem_id, presence: { message: "must be selected" }, uniqueness: { scope: :user_id, message: "can only be sent once" }`
* `validates :attempts, presence: true, numericality: { greater_than: 0 }`
* `validate :valid_date?`
### authorization
* cannot visit uninitiated user's sends via 'users/:user_id/sends'
* cannot visit user's uninitializd send show page via 'users/:user_id/sends/:id'
* `before_action :require_login`
* `before_action :validate_user`
* `before_action :validate_sender, only: [:new, :create, :update, :destroy]`
* `before_action :validate_send_id, only: [:show, :update, :destroy]`

## Styles
### controller
* new
* create
### routes
n/a

## ProblemStyles
### controller
* new
* create
### routes
n/a (part of problems?)
### validations
* `problem_id, uniqueness: { scope: :style_id, message: "Problems can only be given a style once" }`

---
# Additional models if time permits:

## Rewards
### Controller
* index
* show
* new
* create
### model
### routes 
* get '/users/:id/rewards', to: 'rewards#index' -> all rewards available for the month + previously redemmed rewards
* get '/users/:id/rewards/:id', to: 'rewards#show' #=> details of one reward, points needed, user's current points, link_to "Redeem reward", rewards#update? (mark as redeemed/ no longer available)
* get '/users/:id/rewards/new', to: 'rewards#new' #=> only available to admin?
* post '/users/:id/rewards', to: 'rewards#create' #=> only available to admin?
### views
* index
* new
* show
### validations

## Comments
### controller
* new
* create
* edit
* update
* destroy
### routes
* get '/users/:id/problems/:id/comments/new', to: 'comments#new' 
* post '/users/:id/problems/:id/comments', to: 'comments#create' 
* get '/users/:id/problems/:id/comments/:id/edit', to: 'comments#edit' 
* patch '/users/:id/problems/:id/comments/:id', to: 'comments#update' 
* delete '/users/:id/problems/:id/comments/:id', to: 'comments#destroy' 


