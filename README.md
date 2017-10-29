# README #

raven-crashdump provides tools for reporting native program crashes to
https://sentry.io. So far it only contains raven-coredump for use on
Linux/Unix, but the intention is to add raven-minidump later to provide
support for Windows minidumps.

## Linux
On Linux raven-coredump is installed as a coredump handler. It depends
on GDB with python support. It has been tested on Fedora 26, CentOS 6
and 7. Installation:

```
git clone git@github.com:tsondergaard/raven-crashdump.git
cd raven-crashdump
yum install python-requests
sudo ./raven-coredump --install
```

After installation edit `/etc/raven-coredump.conf` and set the DSN.

raven-coredump processes the coredump locally and therefore needs
debuginformation to be present. On CentOS 6/7 you can install this
for your dependencies with `debuginfo-install`, on Fedora with
`dnf debuginfo-install`.
