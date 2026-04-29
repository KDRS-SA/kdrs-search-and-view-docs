---
layout: default
title: print
parent: Ruby View
---
# Print
How to control the layout when the user prints the view, or sends it to PDF.
{: .fs-6 .fw-300 }

# Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Add a print button
The print button is added from xml. See [export]({{ 'xml/export' | relative_url }}).
{% highlight xml %}
    <table>
        <export>print</export>
{% endhighlight %}

## Hide on print / show only on print
Use the built-in classes `k-no-print` and `k-print-only` to control what shows on screen vs paper.

- `k-no-print` is visible on screen, hidden when printing
- `k-print-only` is hidden on screen, visible only when printing

{% highlight erb %}
<div class="k-no-print">
  <p>This is shown on screen, but not on print.</p>
</div>

<h1 class="k-print-only">Customer report</h1>
{% endhighlight %}

## Custom print layout
Combine the built-in classes with a `@media print` stylesheet for further adjustments. \
Here we enlarge the font and force a page break before each customer.

{% highlight erb %}
<style>
  @media print {
    body { font-size: 14pt; }
    .customer { page-break-before: always; }
  }
</style>

<h1 class="k-print-only">Customer report</h1>

<div class="k-no-print">
  <p>Click the print button to export this view as PDF.</p>
</div>

<% @docs.each do |doc| %>
  <div class="customer">
    <h2><%= doc["name"] %></h2>
    <p><%= doc["email"] %></p>
  </div>
<% end %>
{% endhighlight %}

- `page-break-before: always` starts a new page for each customer
- `font-size` can be increased for better readability on paper

`Tip` Increase [`<rows>`]({{ 'xml/rows' | relative_url }}) in xml to get all records in one print or PDF.
