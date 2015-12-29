
## Motivation

Daily Grump was created to send friend and family a GrumpyCat(TM) motivator early every morning. These messages are sent over MMS. The images are hosted on S3 and sample images are included in the images folder.

## Installation

You'll need a few things to get started:
* AWS S3 account
* Twilio account
* Server with CRON

Installation steps:

1. Upload the images to S3.
2. Copy settings.yml.sample to settings.yml
3. Fill in settings.yml with your Twilio and S3 account keys.
4. Copy daily_grump.rb to your server.
5. Setup a cron job.
6. ???
7. Profit

Sample Cron Job:
```
22 14 * * * ruby /home/nickls/daily_grump.rb
```

You'll likely need to setup cron for your RVM:
<code>rvm cron setup</code>

## License

MIT or BSD. your call.
