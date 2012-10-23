ColorRoutes
===========

# DESCRIPTION

ColorRoutes is just a little library bundled with the necessary code to turn the output of the rake routes command from the usable but dull white and black screen to something more vivid and, more important, readable.

NOTE: the first version of this Gem doesn't work under Rails 3. v1.0.0 does.

Enjoy!

# INSTALLATION

`gem install color_routes --version '>= 1.0.0'`(for Rails 3) to add this rake task system wide, or...
```bash
cd myapp/lib/tasks
wget https://github.com/downloads/nicooga/color_routes/color_routes.rake
```
to have this task on a single rails app.

# DEMO

rake routes normal output: 
<img src="https://github.com/nicooga/color_routes/raw/master/doc/demo1.png" title="Example output" alt="Example output" />

rake color_routes output:
<img src="https://github.com/nicooga/color_routes/raw/master/doc/demo2.png" title="Example output" alt="Example output" />