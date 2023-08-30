Rush Repo - DannyBen's Rush Repository
==================================================

```
_______                       ______  
____  /  ___________  ___________  /_ 
___  /   __  ___/  / / /_  ___/_  __ \
__  /    _  /   / /_/ /_(__  )_  / / /
_  /     /_/    \__,_/ /____/ /_/ /_/ 
/_/      Personal Package Manager
```

This is my rush repo for use with the [rush package manager][rush-cli].

- All packages are suitable for public consumption.
- All packages are designed for Ubuntu and Arch Linux.
- Packages under the [my](my) folder are personal packages, most likely not
  suitable for anybody else.

Add this repository
--------------------------------------------------

```shell
$ rush clone dannyben        # download the repository
$ rush get dannyben:hello    # test that it is working
$ rush list dannyben         # see package list
```

Development
--------------------------------------------------

Use the provided docker compose configuration to develop and test on different
operating systems. The containers come with some basic packages (like wget and
curl) and with the local rush repo mounted and connected.

[rush-cli]: https://github.com/DannyBen/rush-cli
