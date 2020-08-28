# SpreeSlider

Add a slider to the homepage of your Spree site, and manage the slideshow from within the Admin panel.

## Installation

1. Add this extension to your Gemfile with this line:

  #### Spree >= 4

  ```ruby
  gem 'spree_slider', github: 'usman-khan-1/spree_slider'
  ```

  #### Spree >= 3.1

  ```ruby
  gem 'spree_slider', github: 'spree-contrib/spree_slider'
  ```

  #### Spree 3.0 and Spree 2.x

  ```ruby
  gem 'spree_slider', github: 'spree-contrib/spree_slider', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rake railties:install:migrations
  bundle exec rake db:migrate
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

### Using the slider

Under Developmet 

