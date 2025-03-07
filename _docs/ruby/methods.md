---
layout: default
title: methods
parent: Ruby View
---
# Methods
{: .no_toc}
These are the available methods for use in Ruby Views.

# Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## Get data

### Example: Get active customers
{: .no_toc}
{% highlight ruby %}
  customers = table("customers", active:true, fields:"name, email")
{% endhighlight %}

### Method
{: .no_toc}
{% highlight ruby %}
  table(table, criteria, fields:, filter:, rows:)
{% endhighlight %}
- `table` table name
- `criteria` Add criteria as needed e.g.: school:"fro", class:"3a", year:"2001"
    - if conflict with built in parameters, wrap them in one pair of curly braces {} as parameter 2
- `fields` comma separated string of fields to retrive, e.g. fields:"first_name, last_name"
- `filter` optional filter with solr syntax. same as tag "filter"
- `rows` default is 20 rows. Increase to improve sorting, or download more files at once. Set 'MAX_ROWS' if needed, but check performance when using large values.
- Returns empty array [] if no hits

## Lookup data
Lookup data in another table. This is similar to using the tag "lookup" in xml

### Example: Lookup address_id to find the city
{: .no_toc}
{% highlight ruby %}
  lookup(main:customers, foreignkey:"address_id", table:"address", primarykey:"id", fields:"city")
{% endhighlight %}
table customers will be updated with the new data

### Method
{: .no_toc}
{% highlight ruby %}
  lookup(main:, foreignkey, primarykey:, fields:, table:)
{% endhighlight %}
- `main` existing variable that you want to extend with more data
- `foreignkey` the foreign key in the main document
- `primarykey` the primary key in the lookup table
- `table` the lookup table that has more info

## Render table

### Render the default @docs variable to screen
{: .no_toc}
{% highlight erb %}
  <%= render 'table' %>
{% endhighlight %}

### Render another table than @docs
{: .no_toc}
If you want to render another table than @docs, you can send the data to the render 'table' method \
Or you could update the default @docs variable as needed.
{% highlight erb %}
  <%= render 'table', docs: movies %>
{% endhighlight %}
- `docs` optional data to be rendered
- `title` optional table title
- `fields` fields to show. By default the @show_fields variable will be used.

### Adding parameters to the table URL
{: .no_toc}
Sometimes the next view may need extra data from the previous view. We can add those to the link by sending them into the render table method. Any parameter except of docs will be added to the url.

- `vi` view index
- `ti` table index
- `primarykey` comma separated list of primarykeys

`NOTE` If you reorder the xml, you must update the view and table index


E.g. here we send info about which view was the previous one, in "from_table". The name of the variable is your choice.

{: .no_toc}
{% highlight erb %}
  <%= render 'table', vi:1, ti:2, primarykey:"personid", from_table:"report" %>
{% endhighlight %}

The next view can check this param
{% highlight erb %}
  <% if params["from_table"] == "report" %>
{% endhighlight %}
