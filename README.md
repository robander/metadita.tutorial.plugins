# Tutorial plugins to go along with metadita blog

Each of these plugins goes with a tutorial originally posted at http://metadita.org/toolkit/

Specifics:
1. `org.metadita.happyhtml`: Happy HTML! How to create a "new transformation type" without
actually creating a new format. Based on the tutorial [Happy HTML for happier content](http://metadita.org/toolkit/happyhtml.html).
1. `org.metadita.moodyhtml`: Moody HTML :-/ How to create a new transformation type (extending an
existing type) that makes use of new parameters. Based on [Moody HTML for variable content](http://metadita.org/toolkit/moodyhtml.html)
1. `org.metadita.morse`: Morse code? Really? How to create a new transformation type that really
is an entirely new format. Based on [But what if I _want_ a whole new transform dot dot dot?](http://metadita.org/toolkit/morse.html)
1. `org.metadita.html5zip`: Hopefully helpful plugin that demonstrates how to use the `temp.output.dir.name` parameter
(added in DITA-OT 2.5). This allows plugins to easily build off of existing transform types like HTML5, while easily
adding post-processing steps (handled inside the temp directory) and/or returning a zip instead of discreet files.
Described in the post [Making zippy HTML (or other zippy output)](http://metadita.org/toolkit/zippy.html)