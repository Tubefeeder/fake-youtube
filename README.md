This is archived as it is no longer needed since Tubefeeder changed to rusty_pipe (similar to NewPipeExtractor) to generate videos.

# Fake-Youtube

Fake the youtube feed-service locally.

## Why is this needed?

When developing [Tubefeeder](https://github.com/Schmiddiii/Tubefeeder), the 
application will need to be recompiled very often. 
This means that every recompile the youtube server will be queried for the feeds. 
Youtube does not like this beeing done too often and will respond that your 
network may be used to scrape their data. 
This will result in a network error in Tubefeeder and your feed not loading.

Note that for normal usage this will probably not happen.

Using this service you will just need to query the feeds once and you will run 
a local server mirroring the feeds.

## Usage

Before using this, make sure that your network currently is not blocked by
youtube, e.g. after a few hours not developing Tubefeeder.

To use this, copy your `subscriptions.csv` file into this repository and run 
the `cache.sh`-script.
This will cache all the subscriptions feeds in `data/videos`. Look at every 
entry and make sure the entry seems like valid xml.

You will now need to run `docker-compose up` to start the server. You can 
leave the server running in the background while developing.

To apply the server to Tubefeeder, run the application with the environmental 
variable `YOUTUBE_BASE_URL` set to `http://localhost`, e.g.

```
YOUTUBE_BASE_URL="http://localhost" cargo run
```
