# frozen_string_literal: true

require_relative "json/version"

module Textbringer
  # Define faces for syntax elements
  # Face.define :json_keyword, foreground: "cyan", bold: true

  class JsonMode < Mode
    self.file_name_pattern = /\.json\z/i

    # Define your syntax highlighting here
    # define_syntax :json_keyword, /your_pattern/

    def initialize(buffer)
      super(buffer)
      @buffer[:indent_tabs_mode] = false
      @buffer[:tab_width] = 2
    end
  end
end
