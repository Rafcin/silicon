# Silicon

Environment for assembly development.

## Installation
```
apt-get update && apt-get install build-essential
```

## Building
Remember to give perms with `chmod +x build` or use `make` with the flexible makefile.

# Working with GDBGUI

You'll need to pull the GDBGUI fork from Greg Baker [here](https://github.com/gregbaker/gdbgui). His version of GDBGUI fixes some issues with displaying registers. This is the fault of React.

## System limit error

If you encounter the error `Error: ENOSPC: System limit for number of file watchers reached` you can increase the max system watchers and GDBGUI will work fine again.

```
# insert the new value into the system config
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# check that the new value was applied
cat /proc/sys/fs/inotify/max_user_watches

# config variable name (not runnable)
fs.inotify.max_user_watches=524288
```