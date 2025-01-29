# Surveyor Demo App

It allows an Admin to create a Survey and add Questions to it. The admin can then assign the Survey to a User.

I've chosen these customizations:

- PostgreSQL
- Tailwind
- Haml 
- RSpec

This project was started with this template: (fast-prototype-template)[https://github.com/teaforthecat/fast-prototype-template]

These are the commands used to get up and running with the domain model:
``` sh
rails g devise User # so users can sign in
rails db:migrate 
rails g active_admin:resource User # so Admins can create Users
rails g model Survey name # Surveys are only created by Admins
rails db:migrate
rails g active_admin:resource Survey

rails g Assignment user:references survey:references
rails db:migrate 
rails g migration add_dates_to_assignments assigned_at:datetime completed_at:datetime deadline_at:datetime

rails g model Question content:text position:integer survey:references
rails db:migrate
rails g active_admin:resource Question

rails g model Answer user:references question:references assignment:references content:text 
rails db:migrate
# Answers do not have an ActiveAdmin resource because Answers come from Users, not Admins

```
