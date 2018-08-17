Rush - My Remote Bash Scripts
==================================================

Rush is a simple bash script that executes other bash scripts from compatible 
GitHub repositories.

It was designed to easily allow bootstrapping new linux machines with your
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


Building your own Rush repository
--------------------------------------------------

1. Create a new repository on GitHub, named `rush`.
2. Each folder you create in this repository is considered a package.
3. Each package needs to have an executable `main` script.
4. In the script, you have the `$SELF` environment variable, which will 
   contain the GitHub URL for the package.

See any of the folders in this repository as an example.


Development
--------------------------------------------------

For local development and testing, use the provided docker-compose 
configuration.

    $ docker compose run bash
    $ rush bootstrap   # or whatever command you wish to test

The docker stack is set up to:

- Start fresh (with rush installed), and store its data in volumes so you can 
  logout and login as needed.
- Have RUSH_REPO point to http://web:3000

