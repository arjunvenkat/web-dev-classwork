### Warm-up challenges

The following exercies used the AMDB app from the end of Week 5, Day 2.

1) Show a movie’s cast (list of actors) on its show page.

On the movie's show page, we can add

    <p>
      <b>Cast:</b>
      <ul>
        <% @movie.roles.each do |role| %>
          <li><%= role.actor.name %></li>
        <% end %>
      </ul>
    </p>

2) Show an actor’s filmography (list of movies) on his or her show page.

On the actor's show page, we can add

    <p>
      <b>Filmography::</b>
      <ul>
        <% @actor.roles.each do |role| %>
          <li><%= role.movie.title %></li>
        <% end %>
      </ul>
    </p>

---

### Validations

Right now we have no way of filtering information that gets into our database. Users can create roles that may only have an actor_id, but not a movie_id. This is a surefire way to attract a lot of `nil:NilClass` errors when your app tries to call a method on a non-existent object. To avoid this problem, we can use some simple logic to police any data before it gets saved.

For example, lets start by creating a User resource that only has one column of username. (FYI, if you see a `$`, that just means the command should be entered in terminal. You don't actually type the `$` )

    $ rails g starter:resource User username:string

What if we want to ensure that all usernames are unique?

**The inefficient way -**

In the create action of the Users controller, we can change

    def create
      @user = User.new
      @user.username = params[:username]

      if @user.save
        redirect_to users_url
      else
        render 'new'
      end
    end

to something like:

    def create
      @user = User.new
      @user.username = params[:username]

      if User.find_by_username(@user.username).present?
        redirect_to new_user_url
      else
        @user.save
        redirect_to users_url
      end
    end

We can make this a little better by adding a notice that tells users they are trying to create a username that's already been used.

We do this in two steps. First, we add a second argument to the redirect_to method in our User create action. It can also take in a hash of options, which can contain a notice for our users:

    def create
      @user = User.new
      @user.username = params[:username]

      if User.find_by_username(@user.username).present?
        redirect_to(new_user_url, {:notice => 'Username already taken'})
      else
        @user.save
        redirect_to users_url
      end
    end

The second step is to add the code `<%= notice %>` wherever you want the notice to be displayed, in this case, the new user view. The top of the new user view will look like:

    <%= notice %>

    <h1>New User</h1>

    <%= form_tag(users_url, method: 'post') do %>

Ok, not bad.  We've just prevented users from creating usernames that already exist. BUT, users can still edit a username and change it to an existing username. We haven't added any filtering code to the update action. We could copy the same code over and adjust it for the update action... or we could apply the same idea just once, at a lower level.

**The better way -**

Model files are the gatekeepers to our databse. Any data that goes in or out must go through the database. If we need to check for bad data, the model file is the place to do it.  Rails even gives us methods to help with the very common problem of validating data.

For example, if we want to validate the uniqueness of usernames going into the database, we can add some code to our User model so it looks like:

    class User < ActiveRecord::Base
      validates :username, :uniqueness => true
    end

That single validation line does all of our work for us. Now lets say there is one User with a username of "Raghu" already in our database. Remember if we want these changes to apply to console, we need to exit console and restart it. If we then try to create another user with a username of "Raghu" in console:

<screen>

and we try to save:

<screen>

We see that the database tries to save, then it rolls back. The save method returns false, because there was an error in saving. If we want to check what happened, we can call u.errors.full_messages and see what went wrong:

<screen>

The validation method even created a user-friendly error message for us: `["Username has already been taken"]`

If we change the name to "Jeff" and try saving:

<screen>

We see that something was inserted into the database because of the `INSERT INTO` command that was written for us, and the save method returns true.

We can add similar methods to other models. Say we want to make sure any rows in the roles table must have a `character_name`, an `actor_id`, and a`movie_id`, we can use the following validations.

    class Role < ActiveRecord::Base
      belongs_to :actor
      belongs_to :movie

      validates :character_name, :presence => true
      validates :actor_id, :presence => true
      validates :movie_id, :presence => true
    end


---

Now we might want to let user vote movies up or down. These votes should connect users and movies, so a Vote model should have a user_id and a movie_id:

`$ rails g starter:resource Vote user_id:integer movie_id:integer`

We want the Vote model to hook up to the User model and the Movie model.  We also want to make sure a Vote object has the columns of user_id and movie_id filled up and that every user can only vote once:

    class Vote < ActiveRecord::Base
      belongs_to :user
      belongs_to :movie

      validates :user_id, :presence => true
      validates :movie_id, :presence => true
      validates :user_id, :uniqueness => true
    end

### Many to Many

If we wanted to connect one table to another with a one-to-many relationship, we added a foreign key to one table. This only works if every row in one table is connected with at most one row in another table.

<screens>


Once you have a many-to-many relationship defined with a join model, and belongs_to and has_many methods defined in all three models, you can directly connect from actors to movies using `has_many :through => :join_table`. This command gives you a method to directly connect tables in a many-to-many relationship. For example, if the Actor model looks like:

    class Actor < ActiveRecord::Base
      has_many :roles
      has_many :movies, :through => :roles
    end

and the Movie model looks like:

    class Movie < ActiveRecord::Base
      has_many :roles
      belongs_to :director
      has_many :actors, :through => :roles
    end

Then you can use the following commands in console to directly connect actors and movies.:

    a = Actor.first
    a.movies

-or-

    m = Movie.first
    m.actors


<screen>

Checklist for creating many-to-many relationship

1. Break a many-to-many relationship into two one-to-many relationships

2. Create a join model to connect the two original models. An instance of the join model belongs to instances of the models being joined

3. Like any other model, a join model represents a real world object. If at all possible, try to think of a real world thing that represents the relationship

   ex) The connection between a movie and an actor is a role

4. Add a `has_many :through =>` on each of the models that the join model is connecting

### Asides:

---

**What happens if you try to save a string into a database column of type integer?**

Rails is pretty forgiving, and will try to convert a string into an integer for you. So, lets say you try to do `actor_id = "3"`. Assuming actor_id should be an integer, Rails will automatically convert "3" into 3. If you try to do `actor_id = "3-yada-yada"`, Rails will convert the string into 3, since it starts with a 3.  If you try to do `actor_id = "yada yada"`, Rails will convert the string into 0, since strings by default convert to an integer value of 0.

