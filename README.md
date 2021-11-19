# app-state-diagram action

This action generates ALPS app-state-diagram.

## Inputs

## `config`

**Required** A config file path. Default: `"profile.xml"`

## Setup GH pages

[Configuring a publishing source for your GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site). Make sure you set the source as `gh-pages` and `root`.

## Example usage

1. Save the following snippet as `.github/workflows/asd.yml`
2. Create `profile.xml` and git push to GitHub
3. Open `https://<username>.github.io/<repository>/`


asd.yml
```
name: ASD documents

on: push

jobs:
  asd:
    runs-on: ubuntu-latest
    name: ASD documents
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Generates ASD documents
        uses: koriym/asd-action@v1
        id: asd
        with:
          config: asd.xml
          profile: profile.xml

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./asd-public
```