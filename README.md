## Android Command-Line SSH

This project is an installer for a non-rooted Android shell command line version of the SSH tools.

### Requirements:

- ARM armeabi-v7a based Android device.
- Android 1.6 or newer.
- You must have a terminal emulator such as Android Terminal Emulator installed on your device.

### Features:

- Installs command-line versions of ssh, scp, and sftp.
- Works on ordinary non-rooted Android devices.

### Install instructions:

- Extract ssh_armeabi-v7a.tgz on android device.

### Use instructions:

```
export HOME=<dir> # $HOME/.ssh is referenced
export PATH=<ssh, scp, sftp path>:$PATH
export LD_LIBRARY_PATH=<*.so path>:$LD_LIBRARY_PATH

mkdir -p $HOME/.ssh
# Place ssh keys, ssh_config, etc. in $HOME/.ssh
chmod 600 $HOME/.ssh $HOME/.ssh/*

ssh user@host
```

### Known Bugs / Limitations:

- Only supports armeabi-v7a devices.
