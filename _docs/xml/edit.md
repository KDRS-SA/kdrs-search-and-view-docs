---
layout: xml
title: edit
parent: XML View
---
Field values can be edited by using this tag. <br>
If the field is renamed, use the new name \
Any Ruby method can be used, as long as its on the format `field.method` or `field[0..3]`. <br>
Multiple methods can be chained, e.g. `field.method1.method2` etc.<br>
A field can have multiple edit tags \
The edits will be done in the final table, after all the lookups (joins). <br>
Sorting will be done after the edits.

## Example
{% highlight xml %}
    <table>
        ...
        <edit>[0..2]</edit> <!-- extracts country code +47 from +4790011111  -->
        <edit>date.in_time_zone</edit> <!-- converts to local time zone  -->
        <edit>date.in_time_zone.strftime("%d.%m.%Y")</edit> <!-- converts to local time zone, and returns string in norwegian date format -->
        <edit>semester.sub("s1","semester 1")</edit> <!-- semester 1 instead of s1 -->
        <edit>grade.sub(/^.{0}$/,"---")</edit> <!-- If no grade, draw a line -->
        <edit>timer.sub(".0","")</edit> <!-- e.g. 5 instead of 5.0  -->
        <edit>location.capitalize</edit> <!-- Trondheim is a city in norway -->
        <edit>location.titleize</edit> <!-- Trondheim Is A City In Norway   -->
        <edit>location.downcase</edit> <!-- trondheim is a city in norway -->
        <edit>location.upcase</edit> <!-- TRONDHEIM IS A CITY IN NORWAY -->
        
{% endhighlight %}

`Note` Searching on edited fields will currently search in the original data.
