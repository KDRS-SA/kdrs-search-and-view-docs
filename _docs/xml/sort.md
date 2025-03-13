---
layout: xml
title: sort
parent: XML View
---
Sort the current page based on the given column. Use the `<rows>` tag to get more data for the current page. If the values seem to be integers, the sort will be numeric. If not they will sort as string.

You can sort on one or more columns, either in ascending or descending order. \
`Note` If the field is renamed, use the new name.

Example:
{% highlight xml %}
    <table>
        <sort>lastname</sort> <!-- sorts in ascending order  -->
        <sort>lastname desc</sort> <!-- sorts in descending order -->
        <sort>date desc, lastname</sort> <!-- sorts by date first in descending order, and then by last name when dates are equal -->
{% endhighlight %}

