brianF
======

Personal site I'm building for my brother.

So far
======
Most of the basic functionality is done.  My goal has been to just have something to show my brother so I can start getting feedback from him.  There's a lot of refactoring I still need to do like getting my routes and folder structure in a more predictably format.

Future plans
======
- Tests (Capybara).
- Switch to mustache templates.
- Change design after getting feedback (currently, it's raw Bootstrap).
- Admin login is currently hardcoded to a route.
- I want to make his resume downloadable (.pdf, .docx, etc.).  Also, right now there's not much functionality in editing the resume page, so I'm considering implement some sort of markdown system.
- Since all the content needs to be editable by the admin, it's all stored in a db.  However, given how infrequently this content will change, it feels a little excessive to be hitting the database in one form or another for every request.  My initial search for how to edit erb/html files using Ruby wasn't very fruitful.  I thought about putting together some kinda messy Regex script, but there's gotta be a more elegant solution.
- Take the `<br><br><br><br>` out of layout.erb.
