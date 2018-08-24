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

All packages are suitable for public consumption. Some packages can be 
executed with `my=yes rush packagename`. When executed like this, additional
steps will be executed.

For more information, visit the repository for the [rush command][1].


Development
--------------------------------------------------

For local development and testing of new packages, use the provided 
docker-compose configuration.

    $ docker compose run bash
    $ rush bootstrap   # or whatever command you wish to test


[1]: https://github.com/DannyBen/rush-command
