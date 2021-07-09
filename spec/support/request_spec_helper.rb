# frozen_string_literal: true

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def enum_validator(enum_hash, request_value, response_value)
    if enum_hash.values.include?(request_value)
      expect(response_value).to eq(enum_hash.key(request_value))
    else
      expect(response_value).to eq(request_value)
    end
  end
end
