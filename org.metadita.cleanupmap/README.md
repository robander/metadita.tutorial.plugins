# Extend preprocessing with a "map cleanup" step

This plugin is an extension of a [DITA-OT Slack channel](https://dita-ot.slack.com/archives/C03SENFUQ/p1536160123000100) thread
about an issue I found in publishing PDF.

As defined in the DITA spec, when you refer to another map using `format="ditamap"` from something like `<chapter>`, 
you're essentially forcing the role of "chapter" onto top level entries in that map. In our implementation, this is
done by forcing the chapter's `@class` attribute on to the pulled top-level entries. This process ensures that 
whatever you pull in is treated like a chapter, preserving the overall intent and structure of the bookmap. 
The process generally works in most cases, even if it makes implementations a bit ugly. There are also 
exceptions for things like `<mapref>` where it would be counter-productive to push the `mapref` role onto
referenced topics. Background and examples using `<chapter>` are here: http://docs.oasis-open.org/dita/dita/v1.3/errata01/os/complete/part1-base/archSpec/base/cascading-of-roles-in-specialized-maps.html

The issue I've encountered is that when you move that map reference from `<chapter>` up to `<part>`, you
suddenly lose all of your chapters. In our implementation, parts are really only allowed to nest chapters
(though the base bookmap model is technically more flexible). So if you have a map branch like this, you'll
end up with "Part I" that nests "Chapter 1" and "Chapter 2":
```
<part href="majorTopic.dita">
  <chapter href="majorTopicFeatureA.dita"><!--...--></chapter>
  <chapter href="majorTopicFeatureB.dita"><!--...--></chapter>
</part>
```

Now, what happens if I need to reuse that same sequence outside of the map? I move that same structure
into a generic map that's used to publish in non-book contexts, and then pull it into my bookmap:
```
In the bookmap:
<part href="reusableMajorTopic.ditamap" format="ditamap"/>

In reusableMajorTopic.ditamap:
<map>
  <topicref href="majorTopic.dita">
    <topicref href="majorTopicFeatureA.dita"><!--...--></topicref>
    <topicref href="majorTopicFeatureB.dita"><!--...--></topicref>
  </topicref>
</map>
```

Now, based on the cascading of roles as defined in the specification, the reference from `<part>`
forces the top-level entry `majorTopic.dita` to be treated as a part. But, critically, it loses
any knowledge that the sub-topics are chapters. Today, in DITA-OT 3.1 (and earlier), I end up with
a PDF that has a "Part I" as before -- but the sections within that are formatted as 
generic topics instead of as chapters. On its own, this is unfortunate; if my map contains other
parts that are *not* coded as references, I end up with some parts where nested topics 
show up as chapters, and other parts where nested topics are *not* chapters.

## The plugin

Because anyone can specialize or constrain markup to require a specific structure -- and generic
DITA-OT steps that resolve maps cannot know about or enforce those structures -- it seemed like
a good idea to make this a generic "Fix map structure markup" process.

This plugin makes use of the general `preprocess.post` extension point - one I've found useful
for a lot of general-purpose extensions. It adds in a simple XSLT step that runs over maps in the temp
directory. All it does is look for:

1. Part elements (match class value ` bookmap/part `), where
1. The child element is a `topicref` but is *not* a `chapter`, and
1. The format is DITA (to make sure we don't turn a `<ditavalref>` into a chapter), and
1. It actually references a topic (or has a title)

In those cases, it forces the role of "chapter" onto the child topicref. 

The plugin also defines an extension point that allows other plugins to make similar changes.
This means if you have a map structure that requires specific children -- but your markup also allows
that structure to be pulled in from another map -- you can plug in to this process and
ensure that the map meets your requirements.

**Note:** This plugin requires DITA-OT 3.0 or higher, as it makes use of the `ant.import` extension
added in that version of DITA-OT.