# app-state-diagram action

This action generates interactive state diagrams and documentation from [ALPS](http://alps.io/) profiles.

## Inputs

### `profile`

ALPS profile file path (JSON or XML). Default: `"profile.xml"`

### `format`

Output format: `html` (default), `svg`, `dot`, `mermaid`

### `label`

Label mode: `id` (default) or `title`

### `output`

Output file path (optional)

## Outputs

### `dir`

Output directory path

## Start from the skeleton

https://github.com/alps-asd/alps-skeleton

## Manual Setup

1. Save the following snippet as `.github/workflows/asd.yml`
2. Create `profile.xml` and push to GitHub

```yaml
name: Generate ASD

on: push

jobs:
  asd:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Generate diagram
        uses: alps-asd/asd-action@v2
        id: asd
        with:
          profile: profile.xml

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ${{ steps.asd.outputs.dir }}
          destination_dir: ${{ steps.asd.outputs.dir }}
```

Each time you commit, the ASD documents will be generated in `gh-pages`.

## Setup GitHub Pages

See [Configuring a publishing source for your GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site). Set the source as `gh-pages` and `root (/)`.

## Migration from v1

v2 uses Node.js instead of Docker/PHP. No config file (`asd.xml`) needed. Just specify inputs directly.

```yaml
# v1
- uses: alps-asd/asd-action@v1
  with:
    config: asd.xml
    profile: profile.xml

# v2
- uses: alps-asd/asd-action@v2
  with:
    profile: profile.xml
```
