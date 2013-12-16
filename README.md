## Trademob Rails Assignment

### Author: Demitry Toumilovich

### Part 1: Platforms for campaigns
I generated a new model called MobilePlatform for this part and then generated a migration to add the database table as well. I try not to use any model names that are in the [list of Rails reserved words](http://bparanj.blogspot.com/2011/07/reserved-words-in-rails.html), that I reference at least, hence the name MobilePlatform versus just Platform.

I then added a join model `MobileCampaign`, so that campaigns can have many mobile platforms and vice versa through this model, and I get the benefit of easier and faster lookups with this model.

### Part 2: Authorization and roles

I usually use the devise gem for authentication and cancan for simple authorization. I added a role field in the admin_users table, so that we can differentiate between user priveleges and can add more roles later. The `ability.rb` class, generated with the cancan gem, holds all of the authorization rules, so that's where the main logic for this part lies.

To get cancan to work nicely with ActiveAdmin, I had to enable the cancan authorization adapter in the active_admin initializer. After enabling this adapter, I was able to add a `rescue_from` block in the application controller to handle unauthorized access as well.

### Part 3: Audit trail for platform changes

I remember using the paper_trail gem at a company I contracted for (LaunchAcademy) to keep track of the changes for multiple ActiveRecord models, such as assignments, students submissions and student help requests. Therefore this gem seemed appropriate.

However, for this part I only wanted to keep track of the changes to one model, so I created a new table `mobile_campaign_versions` and a new class MobileCampaignVersion. I then added the `has_paper_trail` method with some options to the join model `MobileCampaign`. That way I can track when a new mobile platform has been added/removed from a campaign and I can easily add a new section to the ActiveAdmin interface.

To track the destroying part correctly, I added a patch that is provided in the `paper_trail` gem documentation under `config/initializers/active_record_patch.rb`.

### Test this app by running the following

1. `git clone git@github.com:DemitryT/tm-rails-test.git`
2. `bundle`
3. `rake db:migrate`
4. `rake db:seed`
5. `rails s`

If you point your browser to `http://localhost:3000/admin` you can login with either `cm@example.com` or `admin@example.com` and the password `password` for both.

## Notes and Limitations

* I am using ruby version 1.9.3p392
* For Part 3, I added the "campaign_name" meta field when tracking the mobile platform changes with the `paper_trail` gem, so that I could first show the name on the ActiveAdmin interface and second allow users to filter by the campaign name. However, this introduces the issue of what happens when the campaign name changes. In the future, we could either only allow admin users to add the campaign name once and then make it a read-only field. Or, more realistically, let admin users know that when they change the name of the campaign, the audit trail would start tracking the mobile platform changes from scratch for this new campaign name.