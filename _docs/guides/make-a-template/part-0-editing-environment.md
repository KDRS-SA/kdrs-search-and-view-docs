---
layout: guide
title: "Part 0: Editing environment"
nav_order: 1
parent: Make a template
grand_parent: Guides
---

This part of the guide will walk through some recommended options for editing XML template files on a Linux server.

There are many ways of doing this, but our method allows for seamless editing and saving of files on a remote server, in a modern editor with good support for XML files.

However, if you already have a workflow for this that you are comfortable with using, feel free to stick to that.

## Installing VS Code

1. First we need Visual Studio Code, a text editor from code by microsoft. You can [download VS Code here.](https://code.visualstudio.com/)

2. After installing VS Code, open VS Code, then open the following links in a browser and click "Install". They will then open in the VS Code extension viewer where you have to click "Install" again (these extensions may be included in VS Code, if you already have them installed you will se an "Uninstall" button instead):
    - [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) - allows for connecting to a remote machine via SSH and editing files directly in VS Code on your local machine.
    - [Remote - SSH: Editing Configuration Files](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit) - let's you easily edit SSH config files in VS Code.
<br>
*Note: Your browser may ask you if you want to open a link in VS Code. Accept this prompt*

## Connecting via SSH in VS Code

3. Click the remote button in the lower left corner of the screen.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-remote.png)


4. Click "Connect to host".\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-connect-to-host.png)

5. Click "Add new SSH Host".\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-add-new-ssh-host.png)

6. Enter the username and address of the server running KDRS Search & View. For SSH this is formatted as `<username>@<address>`. If you are unsure what to enter here, ask whoever is responsible for managing the server. You will also need the password for the user.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-enter-ssh-connection.png)

7. Select where you want to store the configuration file for SSH. The top option, in your user folder, is most commonly used.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-ssh-config-file.png)

8. Now the server should be added. Open the "Remote Window" again.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-remote.png)

9. Click "Connect to host".\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-connect-to-host.png)

10. Click the SSH host you just added.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-select-ssh.png)

11. Choose Linux if prompted.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-ssh-linux.png)

12. If informed about the server's fingerprint, click continue. This message appears the first time connecting to a server via SSH.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-ssh-fingerprint.png)

13. Enter the password for the account you connected to.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-enter-password.png)
<br>
*TIP: You can create an SSH certificate and add it on the Linux server to allow for easier SSH login without a password. [This guide](https://ganeshvelrajan.medium.com/how-to-setup-ssh-certificates-for-ssh-authentication-3fb3a56d8607) demonstrates one method of doing this.*

## Editing files on the remote machine

1. Click the "Explorer" button in the sidebar and select "Open Folder".\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-explorer-open-folder.png)

2. Enter the path `/var/kdrs/sv/templates/` and click "OK". This is the path of the folder where XML templates are stored.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-open-folder.png)

3. Now we recommend adding the [Red Hat XML extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml). This should be installed in the VS Code window that is connected to a remote server to make sure it gets activated for remote use. Some benefits of this extension are:
    - Warning messages if the XML is invalid
    - Automatic formatting
    - Automatic closing of tags (if you write `<hello>`, you will automatically get `</hello>`)
    - And more...     

*Note: You can find more extensions to use if you want to, but be careful (especially if working with sensitive data). Just like browser extensions, they can contain malicious code. All extensions recommended in this guide are provided by Microsoft and Red Hat, both considered to be highly reputable.*

{: style="counter-reset: step-counter 3;" }
4. You are now ready to edit files. On the left side of the screen you can open the "Explorer" sidebar that let's you navigate the `templates` folder we opened and create files there. If you select a file in the explorer, it will open an editor window in the center.\
<br>
![]({{ site.baseurl }}/assets/images/guides/make-a-template/vs-code-finished-editor.png)
