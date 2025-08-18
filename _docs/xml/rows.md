---
layout: xml
title: rows
parent: XML View
---
Default number of rows is 20. Use this tag to change the default for this view.

{% highlight xml %}
    <table>
        <rows>1000</rows>
{% endhighlight %}

Use keyword max to get our suggested maximum. (Currently set to 10.000 rows)
{% highlight xml %}
    <table>
        <rows>max</rows>
{% endhighlight %}


## Sorting
Beware that sorting will sort this number of rows. One page at a time. If you need to sort across all pages, then increase this number to avoid paging entirely. 

## Performance
Check to see if the increased loading time for the view is acceptable.

`Tip` Increase the number of rows to get them all in a pdf, or sent to printer.