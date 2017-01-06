### v1.3.4

- Also fix the deprecation warning for without-assets/without-rails

### v1.3.3

- Fix deprecation warning about Git SCM plugin
- All default requires from the Capfile are added in the Gem and can be removed

### v1.3.2

- Don't force downgrades to Capistrano 3.5

### v1.3.1

- Our Unicorn setup in cdist now supports zero-downtime Ruby/Unicorn upgrades, so this gem now uses `graceful-restart` on deploys (no changes required in the application)

### v1.3.0

- This gem now requires at least Capistrano 3.5

### v1.2.0

- This gem now requires at least Ruby 2.0.0
