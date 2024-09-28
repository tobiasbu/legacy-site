# tobiasbu website

This is my personal website. 

## Installation instructions

### macOS:

Follow the instructions [here](https://jekyllrb.com/docs/installation/macos/) to install ruby and command-line tools.

Check the [CLI commands here](https://jekyllrb.com/docs/usage/);

In summary:

1. Install basic dependencies: 

```bash
gem install jekyll bundler
```

5. Install npm and ruby dependencies:

```bash
npm install
```

```bash
# Install eventmachine for live reload
gem install eventmachine --platform ruby 
# To install project dependencies
bundle install 
```

### Windows:

For more information [click here](https://jekyllrb.com/docs/installation/windows/) and [here](https://jekyll-windows.juthilo.com/1-ruby-and-devkit/).

1. Install [Ruby+Devkit](https://rubyinstaller.org/downloads/). 
Version must be >= 2.3. 

If you want to use the **live reload** you should download 2.3 without devkit. You must download and install devkit separately.

Use default options for installation.

2. Run the `ridk install` step on the last stage of the installation wizard. This is needed for installing gems with native extensions.

3. After Ruby installation, run in your favorite command prompt the following line to install bundler and jekyll:

```bash
gem install jekyll bundler
```

4. Check if jekyll is installed

```bash
jekyll -v
# or
bundle exec jekyll -v
```

5. Install dependencies:

```bash
npm install
```

6. Install ruby dependencies:

```bash
# Install eventmachine for live reload
gem install eventmachine --platform ruby 
# To install project dependencies
bundle install 
```
**Fix live-reload issue:**

  1. Go to `<DISK>:\Ruby<RUBY-VERSION>\lib\ruby\gems\<RUBY-VERSION>\gems\eventmachine-<VERSION>-x64-mingw32\lib`
  2. Open `eventmachine.rb` file.
  3. In the first line write:
  ```ruby
  require 'em/pure_ruby'
  ```

For more details about this issue: 
  - https://github.com/tabler/tabler/issues/155
  - https://talk.jekyllrb.com/t/bad-file-descriptor-when-using-livereload/1627
  - https://github.com/jekyll/jekyll/issues/7221

## Development

For live-coding, open two command prompts and run:

```bash
# terminal 1
npm run jekyll

# terminal 2
npm run css
```

### Ruby Development

After install all gems in the bundle and for better Ruby development in the VSCode, you should install the extension [Ruby Solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph).

Then in the command line run `bundle exec yard gems` to generate the documentation. This is required for intellisense and other features.


## Site update

1. Add git remote for the website hosting.

```bash
# Add a new remote for you local git. *MUST BE* 'release'
git remote add release https://github.com/<USER>/<REPO>.git
# or
git remote add release git@github.com:<USER>/<REPO>.git

# Verify if new remote was added successfully
git remote -v
```

2. Then to update:

```bash
npm run update
```