# heelmintgames.com

Static site for heelmintgames.com, served via GitHub Pages.

## Local preview

Run a local server that supports HTTP range requests (needed for video seeking):

```
npx http-server -p 8000
```

Then visit http://localhost:8000. (Avoid `python3 -m http.server` — it can't
serve byte ranges, so seeking in the portfolio videos won't work.)
