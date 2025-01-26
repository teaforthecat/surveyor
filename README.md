# Fast Prototype Template

This is an initial setup of a Rails app with ActiveAdmin.

It has chosen these libraries over others:

- PostgreSQL
- Tailwind
- Haml 
- RSpec
 
From here, the idea is to start building an app with Rails generators, such as:

``` sh
rails g model {DomainEntity} attribute attribute 
rails g activeadmin:resource {DomainEntity} 
```

These are the commands that created this template:

``` sh


rails new {name} -d postgresql -T -c tailwind 
cd {name}
bundle add haml-rails html2haml
rails generate haml:application_layout convert
rm app/views/layouts/application.html.erb
bundle remove html2haml
bundle add rspec-rails
rails g rspec:install
rails db:setup
bundle add activeadmin devise draper pundit
rails g active_admin:install
```

Then, to address the issue of Sass from ActiveAdmin not being compiled by Rails 8, this was added:

``` sh
bundle add dartsass-rails
echo "Rails.application.config.dartsass.builds = {\n  'active_admin.scss' => 'active_admin.css'\n}" > config/initializers/dartsass.rb
echo "sass: bin/rails dartsass:watch" >> Procfile.dev
```


``` sh
rails g devise User
rails db:migrate
rails g active_admin:resource User # so Admins can create them
rails g model Survey name # does not get scaffolding - only created by Admins
rails db:migrate # ActiveAdmin needs to table for introspection
rails g active_admin:resource Survey

rails g Assignment user:references survey:references
rails db:migrate 
# does not get a whole ActiveAdmin Resource (yet) because Assignment is a fancy join table
rails g migration add_dates_to_assignments assigned_at:datetime completed_at:datetime deadline_at:datetime

rails g model Question content:text position:integer survey:references
rails db:migrate
rails g active_admin:resource Question

rails g scaffold Answer user:references question:references assignment:references content:text 
rails db:migrate
# does not have an ActiveAdmin resource because Answers come from Users, not Admins

```
