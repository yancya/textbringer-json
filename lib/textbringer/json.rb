# frozen_string_literal: true

require_relative "json/version"

module Textbringer
  # Define faces for syntax elements
  Face.define :json_keyword, foreground: "cyan", bold: true
  Face.define :json_string, foreground: "green"
  Face.define :json_key, foreground: "yellow", bold: true
  Face.define :json_number, foreground: "magenta"
  Face.define :json_structure, foreground: "white"

  class JsonMode < Mode
    self.file_name_pattern = /\.json\z/i

    # Keywords: true, false, null
    define_syntax :json_keyword, /\b(?:true|false|null)\b/

    # Numbers: integers, floats, exponential notation
    define_syntax :json_number, /-?(?:0|[1-9][0-9]*)(?:\.[0-9]+)?(?:[eE][+-]?[0-9]+)?/

    # Object keys: strings followed by colon (higher priority than string values)
    define_syntax :json_key, /"(?:[^"\\]|\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4}))*"\s*:/

    # String values: regular strings
    define_syntax :json_string, /"(?:[^"\\]|\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4}))*"/

    # Structure characters: {}[],:
    define_syntax :json_structure, /[{}\[\]:,]/

    def initialize(buffer)
      super(buffer)
      @buffer[:indent_tabs_mode] = false
      @buffer[:tab_width] = 2
    end
  end
end
