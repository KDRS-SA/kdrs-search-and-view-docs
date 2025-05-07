---
layout: guide
title: Cloning
parent: Working with Git
grand_parent: Guides
nav_order: 3
---

In Git, "clone" means to download a repository (project) to your computer.


To clone a template from Git, open VS Code on the machine you want to edit templates on, or connect remotely. A guide for this can be found [here]({{ 'guide/make-a-template/part-0-editing-environment/' | relative_url }}).

Open the folder `/var/kdrs/sv/templates`

Login to [maler.kdrs.no](https://maler.kdrs.no/) and open the repository you want to clone.

Make sure "SSH" is selected, and click the "Copy URL" button.

![]({{ site.baseurl }}/assets/images/guides/git/cloning/cloning-1.png)

In VS Code, click View -> Terminal

![]({{ site.baseurl }}/assets/images/guides/git/cloning/cloning-2.png)

This will open a terminal at the bottom. Here we can clone the repository with the command:

`git clone <copied-repository-ssh-url>` 

![]({{ site.baseurl }}/assets/images/guides/git/cloning/cloning-3.png)

That's it! Your repository should now be visible in the explorer. You can make commits and push in the "Source Control" tab:

![]({{ site.baseurl }}/assets/images/guides/git/cloning/cloning-4.png)