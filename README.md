# README

Rspec matcher for testing ActiveModel strict validations.
It essentially catches the `ActiveModel::StrictValidationFailed` error and fails the spec if this error is not raised.

Add the file is this repo to the matchers (or support) directory within the spec directory of a Rails project.
Add the following line to the rails_helper to require all files in the matchers directory:

```ruby
Dir[Rails.root.join('spec/matchers/**/*.rb')].each { |f| require f }
```

Use as follows:

```ruby
require 'rails_helper'

RSpec.describe MyModel, type: :model do
  subject(:marketplace) { MyModel.new }
  before do
    # Do something to cause the model to be strictly invalid
  end

  it { is_expected.to fail_strict_validations }
end
```
