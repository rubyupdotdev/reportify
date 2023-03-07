# Reportify

This is a sample application that will take a payload and report to slack for
any spam messages.

## Configuration

1. Environment variables:
```
SLACK_OAUTH_TOKEN
SLACK_CHANNEL
```

## Development environment

[Docker](https://www.docker.com) is recommended for local development.

1. Clone repo
```
git clone git@github.com:rubyupdotdev/reportify.git
```

2. Build local image
```
docker-compose build
```

3. Setup database
```
docker-compose run --rm app bin/rails db:create
```

4. Run test suite
```
docker-compose run --rm app bin/rails test
```
