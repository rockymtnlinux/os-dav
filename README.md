# os-dav
WebDAV container for managing files in Openshift ( and possible kubernetes ) persistent volumes for a project.

Not Much Here Yet!!

While I do need to scratch the above itch, this is a project initiated to acquaint my self with:

1) Using git and github.
2) Using s2i builds ( especially on Openshift ) -- although I may find that it's overkill for this project.
3) Using Openshift templates to make it easy to add the container to a project.

The problem I have is that while I have been able to setup recyclable persistent volumes in Openshift and my developers are able to use persistent volume claims to define storage for their applications,  they still want more.  Copying files via the oc command line is rather clumsy and setting up to the shared volumes is rather problematic in terms of permissions.  I started thinking about my experiences with AWS and Google Cloud and thought that having a web interface into their volumes might be a good idea.

It turns that there is are several Docker containers that provides WebDAV services but I need a few feature that I haven't found yet:

1) Oauth support for authenticating using Openshift embedded Oauth server so that users can login using their Openshift account.

2) HTTPS/TLS support
