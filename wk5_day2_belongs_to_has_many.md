In these notes, we build on the model association techniques from the previous lesson.

**Review Exercies** -

1) Use the Movie#director method we defined last time to make your movies' index page look better(replace directors' ID numbers with names)

2) Try defining an instance method for the Director class called "movies" that returns an array of all the movies associated to a particular Director row

3) Use this method in the details page for a director to show a list of all the movies that belong to that director

**Solution to Review Exercies** -

1) Change `<td><%= movie.director_id %></td>` in the movies' index page to `<td><%= movie.director.name %></td>`

2) Add the following method in your director model file:

    class Director < ActiveRecord::Base
      def movies
        return Movie.where(:director_id => self.id)
      end
    end


3) Add the following code to your director show page:

    <p>
      <b>List of films:</b>
      <ul>
        <% @director.movies.each do |movie| %>
          <li><%= movie.title %> (<%= movie.year %>)</li>
        <% end %>
      </ul>
    </p>

---

Now we want to be able to CRUD a resource called actors, with attributes of name and date of birth. If you have the starter_generators gem installed, the command:
<screen>

Should create the following files for you
<screen>

Then don't forget to `rake db:migrate` to actually set up the table in your database. Remember, the migration file contains your instructions for the database, but you actually need to run your migrations to update your database structure.

Now let's say we want to be able to specify a particular role for an actor, like Bruce Wayne for Christian Bale. A role is also related to a movie; Bruce Wayne is a character in The Dark Knight. The relationships are such that an actor has many roles and a role belongs to an actor. Also, a movie has many roles and a role belongs to a movie. Since we always want the foreign key on the belongs to side, the role model should have foreign keys of actor_id and movie_id. We could create this model using the following command in terminal:
<screen>

Dont forget to `rake db:migrate`!

---

So we've got a table called roles connects to both the actor table and the movie table.  If we have a role object called `r`, we would probably want to easily access the actor that role is connected to with a command of `r.actor`. We might also want to access the movie that role is connected to witha command of `r.movie`. To make these method calls work, we need to define them in our Role model file.

**Exercise**

    class Role < ActiveRecord::Base
      # A role belongs to one actor
      # A role belongs to one movie

      def actor
        # return the Actor object this role belongs to
      end

      def movie
        # return the Movie object this role belongs to
      end
    end

**Exercise Solution**

    class Role < ActiveRecord::Base
      # A role belongs to one actor
      # A role belongs to one movie

      def actor
        return Actor.find_by_id(self.actor_id)
      end

      def movie
        return Movie.find_by_id(self.movie_id)
      end
    end

We can use these methods to clean up our role show page:

    <h1>Role #<%= @role.id %></h1>

    <p>
      <b>Character name:</b>
      <%= @role.character_name %>
    </p>

    <p>
      <b>Actor:</b>
      <%= @role.actor.name %>
    </p>

    <p>
      <b>Movie:</b>
      <%= @role.movie.title %>
    </p>

and our roles index page:

     <% @roles.each do |role| %>
       <tr>
         <td><%= role.character_name %></td>
         <td><%= role.actor.name %></td>
         <td><%= role.movie.title %></td>

         <td><%= link_to 'Show', role_url(role) %></td>
         <td><%= link_to 'Edit', edit_role_url(role) %></td>
         <td><%= link_to 'Destroy', role_url(role), method: 'delete', data: { confirm: "Do you really want to delete this role?" } %></td>

       </tr>
     <% end %>

---

Now, lets go backwards. We might want to go to an actor's show page and see all the roles she has played.  Or we might want to go to a movie's show page and see all the roles in that movie. For this functionality to cleanly work, we need to define a method called `roles` in both our Actor model file:

    class Actor < ActiveRecord::Base
        # An actor has many roles

        def roles
          # return an array of all the roles that belong to this actor
        end
    end

and our Movie model file:

    class Movie < ActiveRecord::Base
      # A movie has many roles

      def director
        return Director.find_by_id(director_id)
      end

      def roles
        # return an array of all the roles that belong to this movie
      end
    end

Our revised Actor model page would look like:

    class Actor < ActiveRecord::Base
      # An actor has many roles

      def roles
        return Role.where(:actor_id => self.id)
      end
    end

and our revised Movie model page would look like:

    class Movie < ActiveRecord::Base
      # A movie belongs to one director
      # A movie has many roles

      def director
        return Director.find_by_id(director_id)
      end

      def roles
        Role.where(:movie_id => self.id)
      end
    end

These methods will let us add role information to our actor show page:

    <p>
      <b>Roles played:</b>
      <ul>
        <% @actor.roles.each do |role| %>
          <li><%= role.character_name %></li>
        <% end %>
      </ul>
    </p>

and our movie show page:

    <p>
      <b>Roles in this movie:</b>
      <ul>
        <% @movie.roles.each do |role| %>
          <li><%= role.character_name %></li>
        <% end %>
      </ul>
    </p>

---

Not bad, things are starting to feel a lot more connected. Our interface could definitely use some work, though. If we want to create a new role on the role#new view, we need to enter in specific IDs for movies and actors. This is horrible! There's no way we can remember specific IDs. A dropdown would be much more usable.

The HTML element we use for dropdowns is the `select` element.

For example, in the new actor section of the role#new view, the `<%= number_field_tag :actor_id %>` can be replaced with:

    <select name="actor_id">
      <option value="1">Christian Bale</option>
      <option value="2">Al Pacino</option>
      <option value="3">Tim Robbins</option>
      <option value="4">Morgan Freeman</option>
    </select>

When someone selects a particular actor, the name of the select element becomes a key in the params hash and the value of that actor's option becomes that key's value in the params hash. For example, if Al Pacino was selected, when the form submits there will be a key-value pair of `'actor_id' => '2'` in the params hash.

This isn't that great, though, since we would need to hardcode all the option values. Fortunately, Rails offers us a couple of method sthat will write the entire select element for us. The method called `select_tag` just writes the HTML select element and the method `options_from_collection_for_select` writes HTML option elements. We use them together. For example, we could write the select and option code from above using:

`<%= select_tag(:actor_id,
      options_from_collection_for_select(Actor.all, :id, :name)) %>`

`select_tag` takes in two arguments. The first argument, `:actor_id`, specifies the name attribute of the select element. The second argument, in this case the `options_from_collection_for_select` method, specifies the options that fill up the select element.

`options_from_collection_for_select` takes in three arguments. The first argument, `Actor.all`, is the collection that populates the dropdown. The second argument, `:id`, specifies which attribute from the Actor model should be sent to the params hash as an option value.  The third argument, `:name`, specifies which attribute the user actually sees in the dropdown.

---

Ok, so when we are hooking our models up to each other it seems like we're repeating a lot of code. The pattern is the same: we define a method that uses a foreign key to pull out one or more objects. Since all that really changes is the name of the model we draw from and the foreign key, we can use a Rails method to save us some time. For example, we can change:

    class Movie < ActiveRecord::Base
      # A movie belongs to one director
      # A movie has many roles

      def director
        return Director.find_by_id(director_id)
      end

      def roles
        Role.where(:movie_id => self.id)
      end
    end

to:

    class Movie < ActiveRecord::Base
      belongs_to :director
      has_many :roles
    end

and significantly clean up our Movie model. The `belongs_to` method takes in a singular name of `:director` and uses it to write the `def director` method and the `has_many` method takes in a plural name of `:roles` and uses it to write the `def roles` method.

Again, like our other shortcuts, if you don't feel comfortable explaining exactly what `has_many` and `belongs_to` is doing, still with the long way until it becomes so tedious you just have to use the shortcuts.

**Asides**

---

**Alternative to self -**

Instead of using `self`, as in the following code:

    class Movie < ActiveRecord::Base
      def director
        Director.find_by_id(self.director_id)
      end
    end

The following syntax can also be used:

    class Movie < ActiveRecord::Base
      def director
        Director.find_by_id(director_id)
      end
    end

This syntax works because we are already inside the Movie class. The interpreter will assume you're calling `director_id` on an instance of the Movie class and specify that work in the background. So when you write `Director.find_by_id(director_id)`, the interpreter will actually process `Director.find_by_id(self.director_id)`. In this case, `self` refers to a Movie object.




