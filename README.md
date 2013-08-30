brianF
======

Personal site I'm building for my brother.

So far
======
Most of the basically functionality is done.  My goal has been to just have something to show my brother so I can start getting feedback from him.  There's a lot of refactoring I still need to do like getting my routes and folder structure in a more predictably format.

Future plans
======
-Tests (Capybara).
-Switch to mustache templates.
-Change design after getting feedback (currently, it's raw Bootstrap).
-Admin login is currently hardcoded to a route.
-Since all the content needs to be editable by the admin, it's all stored in a db.  However, given how infrequently this content will change, it feels a little excessive to be hitting the database in one form or another for every request.  My initial search for using ruby to edit erb/html files wasn't very fruitful.  I thought about putting together some kinda messy Regex script, but there's gotta be a more elegant solution.
-Take the '<br><br><br><br>....' out of layout.erb.
