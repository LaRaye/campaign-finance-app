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
