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


Rush is a simple bash script that executes other bash scripts from compatible 
GitHub repositories.

It was designed to easily allow bootstrapping of new linux machines with your
desired configuration and installed packages.


Install
--------------------------------------------------

    sudo wget -qO /usr/local/bin/rush \
    https://raw.githubusercontent.com/DannyBen/rush/master/rush && \
    sudo chmod +x /usr/local/bin/rush

Or, manually place the [rush](rush) script anywhere in your `PATH`.


Usage
--------------------------------------------------

Execute a package from any Rush GitHub repository:

    $ rush <username> <package name>

For example:
    
    $ rush dannyben hello

You may omit the GitHub username, if it is set in the `RUSH_REPO` environment
variable:

    $ export RUSH_REPO=dannyben
    $ rush hello

Getting packages from non GitHub repositories is also easy. Just set 
`RUSH_REPO` to a full URL:

    $ export RUSH_REPO=http://localhost:3000
    $ rush hello


Building your own Rush repository
--------------------------------------------------

1. Create a new repository on GitHub, named `rush`.
2. Each folder you create in this repository is considered a package.
3. Each package needs to have an executable `main` script.
4. In the script, you have the `$SELF` environment variable, which will 
   contain the GitHub URL for the package, so the script can easily
   download files from its own folder ([example](/gitconfig/main)).

See any of the folders in this repository for additional examples.


Development
--------------------------------------------------

For local development and testing, use the provided docker-compose 
configuration.

    $ docker compose run bash
    $ rush bootstrap   # or whatever command you wish to test

The docker stack is set up to:

- Start fresh (with rush installed), and store its data in volumes so you can 
  logout and login as needed.
- Have `RUSH_REPO` point to http://web:3000

