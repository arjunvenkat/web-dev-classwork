Last time we figured out how to add and update pictures to our app using a web interface. We still need to use console to destroy pictures though. We can use the `object.destroy` syntax to destroy a single row in the database. For example, if we wanted to destroy the object `p`, we would use `p.destroy`. If you want to destroy every row in a databse table, you can run the command `ModelName.destroy_all`. For example, if you wanted to destroy every row in the Picture table, you would run `Picture.destroy_all`. Today we learned how to delete items from a web interface.

For homework, we added a link to the edit picture form from the `/pictures` page.
![edit link][1]

If we want to add a link to delete a picture, maybe we can just add a similar link that goes to `/:number/delete`, and a corresponding route in our routes file
![delete link][2]

This is no good, though. If Google or some other web crawler finds your page, it it uses the links on your page to discover new pages. It basically clicks on each link. With our current syntax, every single picture is going to get deleted by Gooogle. We've got to find some way to let Google know not to click any link that deletes an object. Fortunately, we can use a tool that Rails gives us called `link_to`.

`link_to` is a helper method that takes in two inputs and writes some HTML link for us. The first input is what the user sees, and the second input is the URL the link points to. At this point, it doesn't seem much better than writing out the HTML by hand. Using `link_to` makes our link a bit more readable in the code, but the key reason for us to use it in this situation is a special superpower we get. We can tell `link_to` that our link is deleting an object, and it will write some extra HTML for you that makes your link completely safe from well-meaning, but clumsy web crawlers. We can add a third input, which is hash that tells rails our link is deleting something.
![link to][3]

Since the last input to the `link_to` method is a hash, we can just drop the curly braces. We can also add another key-value pair to our hash that pops up a confirmation window for the user. We end up with something like:
![link to revised][4]

If we dig into the source code, we see a few interesting things that `link_to` does for us. We have an attribute of `data-confirm="Really?"` that pops up a window asking us to confirm a deletion. We also see an attribute of `rel="nofollow"`. This fixes our Google web crawler deletion problem, by telling crawlers not to follow the path of this link. Finally, we have an attribute of `data-method="delete"`. This actually tells Rails that we are deleting something with this link. It uses a framework called REST.
![link to source code][5]


RESTful-style requests use a combination of verbs and nouns to specify what actions need to be taken. Let's start with the verbs. Right now, if we look at our routes file, every single route starts with a verb of `get`.
![routes with all get verbs][6]


 `get` requests are supposed to be safe. They shouldn't delete or update a a resource. Each of these verbs is followed by a noun. For example, the HTTP request `get "/pictures/:number/delete"` uses a verb of `get` and a noun of `/pictures/:number/delete`. The verb is an HTTP method and the noun is a url. The URL looks a bit weird, though. It should just be a noun, but it contains some verb-y stuff like `/delete`. A RESTful route would fully separate the HTTP verb and the URL noun. For example, a more RESTful version of the delete request would look like `delete "/pictures/:number"`. We use a combination of the  `delete` verb and the `/pictures/:number` noun.

This is where the super powers of `link_to` came in handy. For some reason HTML only recognizes two HTTP verbs, `get` (get something) and `post` (create something). Fortunately, Rails can use a variety of HTTP verbs. If we want Rails to use the verb of `delete`, though, we need to somehow drop it a hint in our HTML. The HTML attribute of `data-method="delete"` is what does the trick. This attribute means nothing to HTML, but Rails will see this attribute and know that we want to use an HTTP verb of delete, even though links by default use `get`.

Now that we're looking at the entire routes file, maybe our other routes could use some work as well. Let's work through another example, like `get "/add_to_pictures"`. We can organize this better by making the URL, or Uniform **Resource** Locator, only refer to a resource (the noun). Then we can use an http verb to refer to what we want to do with that resource (the verb). This is what we mean when we use the term **RESTful routes**.  RESTful routes use combinations of http verbs and resource nouns to specify what action should be taken.

We should first think about what resource the `/add_to_pictures` URL is going to change. The resource we're going to change is the pictures resource, which we can refer to with the URL `/pictures`. Specifically, it's going to create a picture. The http verb we use for creation is `post`. So, instead of using the messy verb/noun combination of `get "/add_to_pictures"`, we can use the cleaner, RESTful combination of `post "/pictures"`. Now, we can use the same noun to refer to the same resource across multiple requests, and just change the verb if we want to perform a different action on that resource. Basically, our app won't get confused with repeated URLs if the http verbs are different. **Both** the http verb and the URL are taken together to point the app towards a specific action. If we continue with this idea, we can change all of our routes to verb/noun combinations that, when taken together, route to a specific action. (For some reason, `put` means update, so we can change the update route to use a `put` verb on a particular picture)
![restful routes][7]


While we're editing the routes file, `:id` is preferred as a convention of `:number` since we usually refer to an object's id with this dynamic route segment. This means we need to change `:number` to `:id` everywhere in our app.
![routes with id][8]

Now we can work on our action names. Instead of `list_of_pictures`, which is kind of unwiedly, we can use the more succinct `index`. Index is the conventional action name for a list of objects. Instead of `picture_details`, we're just showing the user a particular picture, so we can change the action name to `show`. If we change the name of the action in our routes file, we need to change these names in our controller and view files as well. We can continue and clean up the rest of our action names as well.
![golden seven routes][9]

These are the Golden Seven routes we use for every resource. They cover the standard actions you'll need to create, read, update or destroy objects. In case you want to check your routes from terminal, you can use `rake routes` to find all the URLs your app supports.



**Asides:**

----------

**git** - Takes snapshots of your code, so you can revisit old versions, or your teammates can visit any versions of your code. Github is a service that stores those snapshots, sort of like Flickr stores your photos but didn't actually take your photos.

Cloning and forking repositories are essentially the same actions, with one small distinction.

When you clone a repository, you make a copy of that repository on your local machine. The copy on your local machine is tied to the original repository.

When you fork a repository you are cloning it but instead of copying the repository down into your local machine, you are copying it into your personal github account. You can then clone down the forked repository from your personal account. If you clone that repository down into your own computer, that cloned repository will be connected to the repository on your account, not the original repository you originally forked from.


**databases** - Instead of building your entire database all at once, Rails encouraes you to first build an essential part of the database, then add on to that core part through migrations. Migrations are just incremental changes to the structure of your database. You can run all of your migrations using the command `rake db:migrate`. When you clone someone's github repo, you get their instructions to set up a database, but not their actual databse itself. The command `rake db:migrate` runs their database setup instructions so your database has the exact same structure. But even though your database structure matches the cloned repo, it starts empty and needs to be filled up with actual data.

Your database keeps track of what version you're on, and only runs migrations after your current version. For example, if your databse is at version 00003, and your last migration file is versioned at 00004, the migration file will get run. If the migration file is versioned at 00003, the databse will assume that migration has already been run. You can check the version of your database with `rake db:version`.

If you make a mistake and need to undo your migration, you can use the command `rake db:rollback`. Be carefull with this command, though, make sure you only rollback migrations that you haven't committed and pushed to github. This `rollback` command will only work if you have the `def down` method filled in your migration, or if you used a `def change` method. `def down` should have instructions for undoing `def up`. For example, if `def up` has `add_column :pictures, :favorite, :boolean`, then `def down` should have `remove_column :pictures, :favorite`.

If you really want to start your database from scratch, you can use the command `rake db:reset`.  Then you can `rake db:migrate` from an empty database. **You'll lose all your data**, though, so be careful.

If you want to see all possible `rake db:` commands, run  `rake -T db`.

**params hash** - When accessing info from the params hash, you can use either a symbol or a string between the brackets. Either `params[:number]` or `params['number']` both work.


  [1]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/221/original/Screen_Shot_2013-04-24_at_9.40.40_AM.png
  [2]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/222/original/Screen_Shot_2013-04-24_at_9.42.59_AM.png
  [3]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/223/original/Screen_Shot_2013-04-24_at_10.43.24_AM.png
  [4]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/224/original/Screen_Shot_2013-04-24_at_11.39.17_AM.png
  [5]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/225/original/Screen_Shot_2013-04-24_at_10.46.14_AM.png
  [6]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/226/original/Screen_Shot_2013-04-24_at_9.52.54_AM.png
  [7]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/227/original/Screen_Shot_2013-04-24_at_10.53.45_AM.png
  [8]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/228/original/Screen_Shot_2013-04-24_at_11.05.15_AM.png
  [9]: http://s3.amazonaws.com/production.lanternhq.com/attachments/files/000/000/229/original/Screen_Shot_2013-04-24_at_11.10.52_AM.png
