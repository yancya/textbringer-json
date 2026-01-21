# frozen_string_literal: true

require "test_helper"

class Textbringer::JsonTest < Test::Unit::TestCase
  test "VERSION is defined" do
    assert do
      ::Textbringer::Json.const_defined?(:VERSION)
    end
  end

  test "JsonMode class exists" do
    assert do
      defined?(Textbringer::JsonMode)
    end
  end

  test "JsonMode file pattern matches .json files" do
    assert do
      Textbringer::JsonMode.file_name_pattern =~ "test.json"
    end
  end
end
