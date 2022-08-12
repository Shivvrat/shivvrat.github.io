Updated 14th November 2020 · 3 minute read

Google Analytics tracking is a free web analytics service offered by Google that tracks and reports website traffic. In this tutorial, I will show you how to add the new Global Site Tag script to your Jekyll website.

> The Global Site Tag provides streamlined tagging across Google’s site measurement, conversion tracking and remarketing products – giving you better control while making implementation easier. By using gtag.js, you will be able to benefit from the latest dynamic features and integrations as they become available.

Login to [Google Analytics](https://analytics.google.com/) and create a new property to receive a Tracking ID for your website.

## Install Google Analytics Tracking

First create a new file called `analytics.html` in your site's `_includes` directory.

Now paste the following Global Site Tag (gtag.js) in to your `analytics.html` file and save it.

```
<script async src="https://www.googletagmanager.com/gtag/js?id={{ site.google_analytics }}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', '{{ site.google_analytics }}');
</script>
```

You will find the above Global Site Tag (gtag.js) under **Admin > Property > Tracking Info > Tracking Code**. Your Tracking ID is displayed at the top of the page.

The `{{ site.google_analytics }}` liquid object I have included above will allow you to set your unique Tracking ID in Jekyll's `_config.yml` file.

## Add your Google Analytics Tracking ID to Jekyll’s Config File

Open your sites `_config.yml` file and add the following lines of code. It is important to reference your own Tracking ID, so replace `UA—XXXXXXXX-X` below with your websites unique Tracking ID.

```
# Google Analytics
google_analytics: UA—XXXXXXXX-X
```

Finally, Google recommends placing this script in the `<head>` section of your site, so that all visits to your website are tracked correctly.

This part may vary depending on what Jekyll theme you are using but you will need to paste the following code just before the end `</head>` tag. For you this could be a `head.html` file located in your site's `_includes/` directory or your `default.html` file in `_layouts/` directory.

```
{% if site.google_analytics and jekyll.environment == 'production' %}
{% include analytics.html %}
{% endif %}
```

In future, when you run `bundle exec jekyll serve` your Analytics tracking will no longer render when browsing your website locally. This prevents visit from `localhost:4000` messing up your analytics because by default Jekyll's environment is set to development.

Great right?

"But how do I setup Google Analytics to only track site visitors on a production environment?" I hear you say.

## Setting Jekyll's Environment to Production

As I have mentioned, we only need to include Google's analytics script when Jekyll's environment is set to production. This prevents us from messing up our analytics with visits from our localhost development server.

If you are using Github Pages to build your site, GitHub Pages will automatically set `jekyll.environment == 'production'` for you.

If you are using another hosting provider, you will now need to prefix the build command with `JEKYLL_ENV=production` like so

```
JEKYLL_ENV=production bundle exec jekyll build
```

If you have followed all the steps correctly, you should now have Google Analytics installed correctly on your Jekyll website.

Unsure?

Open your `_site` folder after you build your site. Check to see if Google Analytics tracking code was added to the `<head>` section of the generated files before you push updates to your live site.

-   [Jekyll](https://desiredpersona.com/tags/jekyll/)
-   [Google Analytics](https://desiredpersona.com/tags/google-analytics/)
-   [Github Pages](https://desiredpersona.com/tags/github-pages/)