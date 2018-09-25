# tobiasbu website

This is my personal website. 

## Installation instructions

Read more about [here](https://jekyllrb.com/docs/installation/windows/).

Windows:

1. Install [Ruby+Devkit 2.4.4-2](https://rubyinstaller.org/downloads/). Use default options for installation.

2. After Ruby installation, run in your favorite command prompt the following line to install bundler and jekyll:

```bash
gem install jekyll bundler
```

3. Check if jekyll is installed

```bash
jekyll -v
```
Or
```bash
bundle exec jekyll -v
```

4. Install dependencies and grunt:

```bash
npm install && npm install grunt -g
```

## Development

Just run

```bash
npm run start
```


## Blog update


1. Add git remote for the website hosting

```bash
# Set a new remote *MUST BE* release
git remote add release https://github.com/user/repo.git
# Verify new remote
git remote -v
```

2. Run:

```bash
npm run update
```