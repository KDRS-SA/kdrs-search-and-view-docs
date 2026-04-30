---
layout: default
title: partials
parent: Ruby View
---
# Partials
A partial is a reusable piece of a view. It makes the code modular and easier to manage.
{: .fs-6 .fw-300 }

## File name
File starts with `_`, e.g: `_diploma_project.html.erb` \
Render the view with name only `render 'diploma_project'`

## Example
`_diploma_project.html.erb` from the `extens` template:

{% highlight erb %}
<h4>Prosjektoppgave</h4>
<table>
  <tr><td>Tema:</td><td><%= topic %></td></tr>
  <tr><td>Tittel:</td><td><%= title %></td></tr>
</table>
{% endhighlight %}

Called from `_diploma.html.erb`:

{% highlight erb %}
<%= render 'diploma_project', topic: oppgave_tema, title: oppgave_tittel %>
{% endhighlight %}

## Reuse
Three sections on the diploma, but with less code:

{% highlight erb %}
<%= render 'diploma_comment', table: merknader_person, field: "merknad", title: "Merknad" %>
<%= render 'diploma_comment', table: merknader_fag,    field: "merknad", title: "Fagmerknad" %>
<%= render 'diploma_comment', table: vedlegg_person,   field: "merknad", title: "Vedlegg" %>
{% endhighlight %}


`Tip` Sending data into a partial is optional
