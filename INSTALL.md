# log-classifier Configuration & Build Instructions

---
## Prerequisites
- [Stack](https://github.com/commercialhaskell/stack/blob/master/doc/install_and_upgrade.md)
- [Nix](https://nixos.org/nix/download.html)

## Download log-classifier

Choose the path you want to install log-classifier into.
Let us assume this is /home/$USER/log-classifier

```
$ git clone https://github.com/input-output-hk/log-classifier.git /home/$USER/log-classifier
$ cd /home/$USER/log-classifier
```
## Configuring log-classifier

You will need the following:
  - Numeric ID of the user assigned tickets you want to analyze ($ASSIGNED_TO)
  - API Token ($API_TOKEN)

An API can be generated for you by an admin. The admin can follow [these instructions](https://support.zendesk.com/hc/en-us/articles/226022787-Generating-a-new-API-token-).2
  
```
$ cd /home/$USER/log-classifier
$ echo -n $API_TOKEN > token
$ echo -n $ASSIGNED_TO > assign_to #NOTE: The -n is important, without it echo will append a newline char and it will not work.
$ stack build
```
