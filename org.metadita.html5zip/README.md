# Plugin to place all of your HTML5 output into a single zip

Source code for the plugin described in a blog post here:
http://metadita.org/toolkit/zippy.html

This plugin takes advantage of the new `temp.output.dir.name` parameter added in 
DITA-OT 2.5 (so this will only work with DITA-OT 2.5 and later). That parameter
allows the entire result of your build to be placed into a new directory within `temp`,
so that you can do [...whatever you need...] to the files before returning
[...whatever you want...]. To use this plugin, place the contents of
this `org.metadita.html5zip` directory into your DITA-OT 2.5 plugins directory,
integrate, and select a transform type of `html5zip`. All other HTML5 parameters can
be used as normal.

With this plugin, all I'm doing at that point is zipping the files, so that I still
get all of my content but already zipped up. This is particularly helpful if running
DITA-OT over a network connection, but might be the preferred output in many cases.

The new parameter allows all of this to happen within the context of the temporary
directory, so I never have to create or delete extra files in my source or output 
directories. For details on the parameter, see: https://github.com/dita-ot/dita-ot/pull/2670

For details on the plugin, how it's used, and how to extend this for your own use, see:
[Making zippy HTML (or other zippy output)](http://metadita.org/toolkit/zippy.html)
