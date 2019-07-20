Rails Project - Campaign Finance App

User
  Username
  Email
  Password
  Has many donations?
  Has many candidates through donations? Favorites?

Candidates
  Name - string (first and last?)
  Party Affiliation - string
  Position - string
  Locale - zip code? - integer?
  Voting record?
  Platform / Description?
  Has many donations
  Has many donors through donations
  Total donations
  Total donations by industry
  Favorites?

Donations / Contributions
  Amount
  Date
  Belongs to candidate
  Belongs to donor (user ?)

Donors / Contributors
  Name
  Donor Type:
    Candidate/Self-Funding
    Individual - Large or Small? If above or under $200
    PAC
    Other
  Industry / Affiliation if Large Donor or PAC
  Has many donations
  Has many candidates through donations


Associations order in models matters*
Sessions - home - sessionscontroller

To Do
work on favs associations
sign in / sign up ; log in / log out
password authentication etc
validations
errors!!
views - forms
  index view of favs
scope methods
  various queries
routes / controllers
Associations order in models matters*
Sessions - home - sessionscontroller

Edit route issue for contributions
Finish crud for all models
Category - large or small donors
Index alphabetical (scope method?)
Methods for dot chaining in forms
Validations
Errors
Scope methods?
Favorites situation
Routes as:
Navigation for user
Appearance
form partials
video to fix formatting when form does not submit
Customize /users/:id
Fix migrations belongs to / references?
