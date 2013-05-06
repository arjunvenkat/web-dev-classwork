Heroku uses the Postgres database instead of Sqlite3. If we want to push our app up to heroku, we'll need to adjust your gemfile. The gemfile is located in the root folder of your app. If you have your app open in Sublime, it should be one of the loose files on the bottom of the folder tree.  Look at the section that specifies the sqlite3 gem:

    gem 'sqlite3'

We want to still use sqlite3 for development on our local machine, but we want Rails to switch to a postgres gem when we push production code up to Heroku. We can specify this action by using development and production groups. Just replace the above `gem 'sqlite3'` line with:

    group :development do
      gem 'sqlite3'
    end

    group :prouduction do
      gem 'pg'
    end

Then `bundle install` to implement these changes to your gemfile.

Now that you've changed `gemfile.lock`, you need to commit those changes with a two step process of adding then commiting your changes with git. If you haven't initialized your app as a git repository, start on step 1. Otherwise go straight to step 2.

1) Run `git init` to initialize your app as a git repository.

2) Run `git add -A`, which makes git aware of all the changes you've made to your app, then run `git commit -m "adds pg gem"` to have git take a snapshot of your changes.

Great! So git now knows about your changes and has taken a snapshot of your app in its current state. Now we need to create an app on heroku. Inside your app folder, from terminal, run

    heroku create

You will see some feedback letting you know that you've just created an app on heroku.

<screen>

If instead you wanted to use a custom heroku domain name, such as 'my-test-app.heroku.com' you can use a command like:

    heroku create my-test-app


Now you should see heroku listed as a remote repository by using the command `git remote`. Now you can push to the remote that's named `heroku` by using the command:

    git push heroku master

This format used four important keywords:


**[your program]**  **[your action]**  **[which remote]**  **[which branch]**

your program: `git`

your action: `push`

which remote: `heroku`

which branch: `master`

Once you've pushed correctly, you should see the following feedback in terminal:

<screen>
<screen>

Looks like you're done, right?! Not quite. If you check out your live app using the url that heroku provided, you might see an error that looks like:

<screen>

This wonderfully descriptive message tells you absolutely nothing about what actually went wrong. This happens because in production mode, you shouldn't show users detailed error messages. If you want to see specific errors, you can check your app's server logs with the command

    heroku logs --t

This will pull up a running server log that's very similar to the local server log you get with the `rails s` command. In our case, we might get an error because we haven't actually set up our database yet. We haven't run `rake db:migrate`! You can run any normal Rails command in heroku by sticking the keywords `heroku run` in front of your command. For example, if you wanted to run rake db:migrate on heroku, you would use the terminal command of:

`heroku run rake db:migrate`

That should take care of one of the most common errors when first pushing up to heroku. If everything went well, your app should be up and live at a heroku domain!
