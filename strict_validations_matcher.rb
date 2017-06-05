RSpec::Matchers.define :fail_strict_validations do |expected|
  match do |actual|
    begin
      actual.valid?
      false
    rescue ActiveModel::StrictValidationFailed
      true
    end
  end

  failure_message do
    "expected that #{actual.inspect} to fail strict validations"
  end

  failure_message_when_negated  do
    "expected that #{actual.inspect} NOT to fail strict validations"
  end

  description do
    "fail strict validations"
  end
end
