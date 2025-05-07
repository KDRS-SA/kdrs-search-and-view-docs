---
layout: guide
title: "Part 1: Loading SIARD files"
nav_order: 2
parent: Make a template
grand_parent: Guides
---
Uploading of SIARD files is done in DBPTK (Database Preservation Toolkit), which interprets SIARD files and loads the data into a modern database system that can be used by KDRS Search & View.

1. Access DBPTK by using your browser and navigating to the web address KDRS S&V runs on followed by `:8080`.\
For example, as our server has the address `innsyn.detbestearkivet.no` we would have to navigate to `innsyn.detbestearkivet.no:8080`.\
*Note: The default port is 8080, but it is possible this has been changed for your installation.*

1. Click "LOAD SIARD FILE"\
<br>
![DBPTK dashboard with "LOAD SIARD FILE" highlighted]({{ site.baseurl }}/assets/images/guides/make-a-template/load-siard-file.png)

1. Click "CHOOSE FILES..." and select the sakila.siard file that you downloaded in the [prerequisites](../prerequisites).

2. Wait until the status indicator shows a green checkmark and click "OPEN SIARD".\
<br>
![Finished upload status with "OPEN SIARD" highlighted]({{ site.baseurl }}/assets/images/guides/make-a-template/open-siard.png)

1. Now our file is uploaded, but we still have to make DBPTK index the data for KDRS S&V to access it. This is done by clicking "BROWSE" in the database overview.\
<br>
![Sakila database overview with "BROWSE" highlighted]({{ site.baseurl }}/assets/images/guides/make-a-template/browse-siard.png)
**NOTE:** This step takes a long time. You can proceed to part 2 of the guide while waiting, as we do not need the indexing to be finished until part 3.

1. When the indexing is finished, you should get the popup "SIARD data successfully imported". You can also verify that the processing was successful by ensuring the "Status" in the database overview is "Ready".