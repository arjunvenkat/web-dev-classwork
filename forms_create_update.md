So far we have pictures and picture details. We hardcoded some information, but if we want to get more information into our database, we can only add it through the rails console. This is no good for our users. We want to let our users type information into a form on a web page.

First we want to get a form to just show up in our app.


We created a route in our routes file. <screenshot 1> We expect to get an error saying we don't have a new_picture_form action. We get something different though. This happens because the routes file reads from top to bottom, and the routes file assumes we typed in a match for the second route, which goes to picture_details. This happens because the second route has a placeholder after `/pictures`, which takes in any user input. The interpreter assumes that the 'new' in `/pictures/new` is the value of `:number` in `/pictures/:number`. We can fix this by moving the route up past the second file, so it gets hit first. <screenshot 2>

Now we need to create a form in html. We practiced by creating a form in a sandbox html file. <screenshot 3>

We can plug this form into the new_picture_form view. Our form doesn't go anywhere yet though, since the action is just set to "#". If we want our form to send its data to another url, such as "/pictures/insert_pictures", we would need to set the action to that url. We shoud also change 'url' to 'source' in order to better match our database. <screenshot 4>

So then, if you type the following information into the form: <screenshot 5>
You would see the following information in the params hash: <screenshot 6>

We get an error, though, since we havent specified a route for the "/pictures/insert_pictures" url. We support that url with the following route in the routes file: `get "/add_to_pictures", :controller => "Pictures", :action => "insert_picture"`


We actually insert the picture inside the insert_picture action in the Pictures controller. All the information comes in from the params hash, which we access using the general syntax of `params[:key]`. We first create a new Picture object, then fill each attribute of the picture object, then save the picture. We also want to redirect the user to the picture show page instead of taking them to a separate view. <screenshot 7>

Next, we need to be able to click a link and edit one of our pictures. We should get taken to a form that allows us to edit our picture. We need a route that takes us to an edit picture form. We use a route that looks like: `get "/pictures/:number/edit", :controller => "Pictures", :action => "edit_picture_form"`. The convention in rails is to first specify the resource you're going to with `/pictures/:number` then specify the action you want to take with `/edit`. Then we create the corresponding action in the controller. We want to edit a specific picture, so we can pull up the picture in the edit_picture_form action and then send it to the view in an instance variable. We also might need to use the picture's id, so we can send that to the view as well.
<screenshot 8>



Next, we have to paint the form in a view page. We could just copy and paste the exact same form from our new_picture_form view. However, if we do this, our user is going to see blank form fields. It would be nice if we could could pre-populate the form fields with information from our @pic object. Fortunately, we can use the @pic object and the `value=""` attribute to pre-populate the form fields. We also want to make sure we pass on the pictures id number, so the action knows which picture to edit. We can send this through in our action attribute.
<screenshot 9>

Now we have to create an RCAV to update our picture object. We can use a route that looks like: `get "/update_picture/:number", :controller => "Pictures", :action => "update_picture"`

In our controller action we want to first find the picture, then we need to set the attributes using information from the params hash. Finally, we should redirect to the show page of the object the user is editing.






















aside:

rake db:seed - When you pull down code from github, you don't pull down the database as well. You need to create a database on your own machine and fill it up from scratch. rake db:seed allows you to run some ruby code that will automatically seed your database. The file isn't magic, you have to write the code in the seeds file. It's a good idea to have a seeds file if you want to give anyone some dummy data to work with if they're developing your app.
