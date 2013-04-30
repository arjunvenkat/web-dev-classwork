In this lesson we'll start to connect models together in your aap. First, create a new rails app called amdb. This app will work sort of like IMDB. It will contain all sorts of information about movies, such as directors, actors, roles and reviews.

Here is one basic set of user stories for our app. We want our users to be able to:

1. create  a director with a name and date of birth
2. see the details of a particular director
3. see a list of all directors
4. edit a director
5. delete a director

We could go through the supreme hassle of writing our routes, controller and views by hand...

Or, if we genuinely understand every line inside and out, we can save some time by using a generator. If you have the starter generators gem installed on your computer, you can use:

`rails g starter:resource director name:string dob:date`

This command will generate a model file, a migration, routes, a controller and four view templates. Most of the functionality you need across resources is the same, so we can automate this process.

Once the files have been generated, check the migration, then run `rake db:migrate`. Congratulations! You've gotten a full database backed resource in less than a minute.

---

Let's say we now wanted to add a movies resource to our app. Maybe our movies table should have columns of title, year and director. First, we need to determine the data type for each of these columns. Title should  be a string. Year should proably be an integer, since we might be comparing years. Director should be a string, for the directors name. We can generate this resource with `rails g starter:resource movie title:string year:integer director:string`, then `rake db:migrate` to add the table to our database.

Now if we want to search for the director that directed the first movie, we can use the following commands in console:

    m = Movie.first
    Director.find_by_name(m.director)

However, we could run into some problems here. What if two different directors have the same name? Or what if the director name was misspelled in one or more movies? One common workaround to this problem is using **ID**'s instead of strings for identification purposes. ID's are uinque to each object, even if the contents of two objects are exactly the same. If we want to use ID's though, we have to create a migration to remove the director column from the movies table. Then we have to create another migration to add a director_id column to the movies table:

first migration command:

`remove_column :movies, :director`

second migration command:

`add_column :movies, :director_id, :integer`

Now we can use a director's id instead of name, which is much more robust.

    m = Movie.first
    Director.find_by_id(m.director_id)

---

We've now connected our directors table and our movies table, using the director_id column. These connections are critical to creating most Rails apps. They generally fall into two categories: **one-to-many** relationships and **many-to-many** relationships. We'll just focus on one-to-many relationships right now. An example is that a director has many movies, but a movie only belongs to one director (for the purposes of our app at least). **We always put the id column, or the foregin key, in the belongs_to side of the relationship.** In this example, a movie belongs_to a director, so the movie would have a `director_id` column.

**Challenge:**
Pull up the first movie in your database and save it to a variable called `m`. Using only the variable `m` in console, find the date of birth of the director who directed this movie.

**Solution:**

    m = Movie.first
    Director.find_by_id(m.director_id).dob

**Challenge:**
Display the director's name instead of id in the movie show page

Currently if we go to a movie's show page, we see something like:
<screen>

We want to see "Christopher Nolan" instead of "1"


**Solution:**
Right now our code to display the director on the movie show page looks like:

    <p>
      <b>Director:</b>
      <%= @movie.director_id %>
    </p>

We should pull up the director's name instead of displaying the name right away.  We can use the director_id to find a director, then pull out the name from that director object:

    <p>
      <b>Director:</b>
      <%= Director.find_by_id(@movie.director_id).name %>
    </p>

This is a lot of code in the view, though. We should abstract as much logic as possible into the model and leave the view to just present information.

We can add a method in our `movie.rb` model:

    class Movie < ActiveRecord::Base
      def director
        Director.find_by_id(self.director_id)
      end
    end

Now we can clean up our view code:

    <p>
      <b>Director:</b>
      <%= @movie.director.name %>
    </p>

We just start with our movie object, pull up the director, then drill down to get the director's name.

---

**Asides**

---

**Optional syntax for ruby hashes** -

normal syntax:
`{:sport => 'hockey' :color => 'purple'}`

**IF** your hash keys are symbols, you can use the following syntax:
`{sport: 'hockey', color: 'purple'}`

It's a bit less noise and typing.


**More `find_by` syntax** -

We already know that you can use the method `find_by_id` to return an object with a specific id

If you have a column in your database, you can use that column name combined with `find_by`

For example if you have a table named `Pictures` with a column of `favorite`, you can use the query `Picture.find_by_favorite(true)` to find the first row in that table that matches the following condition: `favorite == true`.  If you want to find ALL pictures that match the condition of `favorite == true`, you can use the query `Picture.find_all_by_favorite(true)`. `find_all_by` will return an **array** of Picture objects.

**The `where` method** -

This will find all rows that match some criteria.  `where` returns an array of objects. You can repeat the above query of finding favorite pictures by using the command `Picture.where(:favorite => true)`. You pass in a hash with key value pairs that match your condition. If you wanted to find all pictures where favorite is true AND that have a caption of 'HTML', you can use the command `Picture.where(:favorite => true, :caption => 'HTML')` Adding more key-value pairs makes the query more specific.  Each returned objects match all of your given conditions.



**Writing a migration** -

If you want to remove a particular column for a table, first write a descriptive name for your migration

`rails g migration RemoveFavoriteFromPictures`


This descriptive name doesn't affect the functionality of the migration, it is mostly for your own reference in the future. In your migration file, you'll see something like

    class RemoveFavoriteFromPictures < ActiveRecord::Migration
      def up
      end

      def down
      end
    end

-or-

    class RemoveFavoriteFromPictures < ActiveRecord::Migration
      def change
      end
    end

You should edit the `def up` portion or the 'def change' method in the migration to edit your databse.  The `def down` condition specifies the commands to rollback your database. We use the `remove_column` method, with the first argument standing for the table name, and the second argument standing for the removed column. The naming of this command is functionally important.

    class RemoveFavoriteFromPictures < ActiveRecord::Migration
      def up
        remove_column :pictures, :favorite
      end

      def down
      end
    end

If you were expecting to use the `rake db:rollback` command, you would have to fill out the def down method as well. The `down` method should undo the `up` method.

    class RemoveFavoriteFromPictures < ActiveRecord::Migration
      def up
        remove_column :pictures, :favorite
      end

      def down
        add_column :pictures, :favorite, :booleans
      end
    end

Check out the Rails guides for more info on method and syntax for migrations.



**Improvements to your routes file**

We've been using a long form syntax for our routes of:

`get '/pictures' => { :controller => 'Pictures', :action => 'index' }`

or

`get '/pictures' => :controller => 'Pictures', :action => 'index'`

A shorter version of this syntax is:

`get '/pictures' => 'Pictures#index'`

The first part of the string is the controller, then you insert a hash, and the second part of the string is the index. This syntax allows us to remove `:controller =>` and `:action =>`, which will save some time.

In your routes file, you need to specify an action for your root. You use the syntax of:

`root :to => 'Pictures#index'

This will tell the root url of your app to go to the index action of the Pictures controller. The benefit of using this strategy is that you get the two free named routes, `root_url` and `root_path`, that point to your root action.

