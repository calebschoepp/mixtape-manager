# Prerequisites

It is expected that you have the following software already on your system.

- Docker and Docker Compose
- `rbenv`
- `ruby 3.1.0` (installed via `rbenv`)
- `node` (a newer version)
- `yarn` (a newer version)
- `heroku` CLI

# Setup

## Clone the repository

```shell
git clone https://github.com/calebschoepp/mixtape-manager.git
cd mixtape-manager
```

## Install dependencies

```shell
bin/bundle install
yarn install
```

## Set environment variables with Figaro

Create a file at `config/application.yml` and insert the following contents:

```yaml

```

## Initialize database

See **Running in development** for how to start your database.

```shell
rails db:create
rails db:migrate
```

# Running in development

## Start Postgresql & Redis

```shell
docker-compose up
```

Run `docker ps` to confirm the containers are running. When you are done with these containers run:

```shell
docker-compose down
```

## Serve

The following will run the rails server, a sidekiq worker, a js compiler on watch mode, and a css compiler on watch mode. To see the commands to run them individually look at `Procfile.dev`.

```shell
bin/dev
```

Now you can see the app at http://localhost:3000.

# Code Review

For pushes to master are not allowed. Tests must pass in Github before a PR can merge. Ideally somebody reviews your code.

If you need to fix the formatting of your code `bin/bundle exec rubocop --auto-correct-all` will usually do the trick.

# Testing

```shell
bin/rails test
bin/rails test:system
```

# Debugging

To open up a live REPL session in the context of the server run:

```shell
rails console
```

To set a breakpoint in your code that starts a REPL session insert the line `debugger` somewhere. Note that to use `debugger` you will need to start the server individually with:

```shell
bin/rails server
```

# Running in production

## Add Heroku remotes

Before you can start interacting with production you'll need to setup your git remotes.

```shell
heroku git:remote -r prod -a mixtape-manager-prod
heroku git:remote -r staging -a mixtape-manager-staging
```

## Pushing code

To push code up to production run:

```shell
git push prod main
```

## Migrations

If you pushed some code that depends on some migrations you will need to run the following after you push your code.

```shell
heroku run bin/rails db:migrate
```

## Debugging in production

If you need to debug something in production you can hop into a Rails console with the following. Note that `--sandbox` prevents you from writing to production for saftey.

```shell
heroku run bin/rails console --sandbox
```

# Other useful things to know

- You can monitor background jobs at `/sidekiq`. You need to be logged in as an admin to do so.
- You can view and edit all application data from a pretty admin panel found at `/special/sauce`. You need to be logged in as an admin to do so.
