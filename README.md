# Middleman

At Hack Club, we use airtable a lot. Sometimes it's hard to keep track of which apps are making calls to airtable, and consuming the global airtable ratelimit. A common problem we run into is that one of our apps start to hit the limit with faulty retry logic, then bottleneck all of our services at once.

Middleman is a way to pipe all of our airtable requests through one location so we can track which apps are the most noisy.

Here's how you use it:

## fetch / curl / etc. (recommended)

You can just swap out your calls from `https://api.airtable.com/v0/api` to `https://middleman.hackclub.com/airtable/v0/api`. For example:

```git
- const urlBase = 'https://api.airtable.com/v0/api/'
+ const urlBase = 'https://middleman.hackclub.com/airtable/v0/api/'
  const url = urlBase + 'YOUR_BASE_ID' + '/' + 'YOUR_TABLE_NAME'

  const response = await fetch(url, {
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'User-Agent': "MY_APP_NAME"
    },
  }).then(r => r.json())
```

Please also set your `User-Agent` to something specific to your app! The whole point of this is to hunt down apps that are having trouble and we can't do that if we can't tell who you are!

## Airtable.js

Airtable.js's persistent retry logic is why we built this in the first place, so we don't really recommend using it. If you must though, it already has some built-in ways to handle this.

You can just set `AIRTABLE_ENDPOINT_URL="https://middleman.hackclub.com/airtable"`