Rush - Linux Workstation Bootstrapper
==================================================

```
_______                       ______  
____  /  ___________  ___________  /_ 
___  /   __  ___/  / / /_  ___/_  __ \
__  /    _  /   / /_/ /_(__  )_  / / /
_  /     /_/    \__,_/ /____/ /_/ /_/ 
/_/      Linux Workstation Bootstrapper
```

This is my rush repo.

All packages are suitable for public consumption. Packages under the [my](my)
folder contain personal additional configuration that should normally not be
used by anyone else.

To see package index from the command line, run `rush /index`.

For more information, visit the repository for the [rush command][1].


Development
--------------------------------------------------

For local development and testing of new packages, use the provided 
docker-compose configuration.

    $ docker compose run bash
    $ rush bootstrap   # or whatever command you wish to test


[1]: https://github.com/DannyBen/rush-command
