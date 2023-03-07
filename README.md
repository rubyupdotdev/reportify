# Reportify

This is a sample application that will take a payload and report to slack for
any spam messages.

## Configuration

1. Environment variables:
```
SLACK_OAUTH_TOKEN
SLACK_CHANNEL
```

## Usage

Post a json payload to the `/events/report` endpoint. Example:

```
curl --header "Content-Type: application/json" \
     --request POST \
     --data '{ "RecordType": "Bounce", "Type": "SpamNotification", "TypeCode": 512, "Name": "Spam notification", "Tag": "", "MessageStream": "outbound", "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.", "Email": "zaphod@example.com", "From": "notifications@example.io", "BouncedAt": "2023-02-27T21:41:30Z" }' \
     http://localhost:3000/events/report
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

## Production environment

Regardless of which production option you choose, you will require docker
installed on the target servers.

### Option 1: docker compose

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
docker-compose -f docker-compose-production.yml run --rm app bin/rails db:create
```

4. Start application
```
docker-compose -f docker-compose-production.yml up -d
```

### Option 2: mrsk (experimental)

1. Configure the `config/deploy.yml` file to suite your production targets.

2. Run deploy (theoretically)
```
mrsk deploy
```
