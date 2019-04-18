ColorRoutes
===========

# DEPRECATED

**This is a small project that I carried on when I was just started programming.
Since then, Rails upgraded to major versions from 3 to 5, internal APIs changed.
I'll leave this here just for historical purposes, and for my own amusement (and disgust) reading my old code. Wish you a very happy and productive day. Kthxbye**

# DESCRIPTION

ColorRoutes is just a little library bundled with the necessary code to turn the output of the rake routes command from the usable but dull white and black screen to something more vivid and, more important, readable.

NOTE: the first version of this Gem doesn't work under Rails 3. v1.0.0 does.

Enjoy!

# INSTALLATION
```bash
cd my_rails_app
curl https://raw.github.com/nicooga/color_routes/master/lib/color_routes/rails/tasks/color_routes.rake -o lib/tasks/color_routes.rake
```
to have this task on a single rails app.

# DEMO

rake routes normal output: 
<img src="https://github.com/nicooga/color_routes/raw/master/doc/demo1.png" title="Example output" alt="Example output" />

rake color_routes output:
<img src="https://github.com/nicooga/color_routes/raw/master/doc/demo2.png" title="Example output" alt="Example output" />

# Notes and TODO's

  + Make the 'gem' part of color_routes gem real
