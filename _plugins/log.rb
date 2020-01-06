require 'rbconfig'
puts RbConfig::CONFIG['host_os']
IS_WIN32 = (RbConfig::CONFIG['host_os'] =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/) == 0

puts IS_WIN32

# require 'colorize' if IS_WIN32 == true
require 'rainbow'
Rainbow.enabled = true

# String.disable_colorization = false # enable colorization

# def color_codes
#   {
#     :black   => 0, :light_black    => 60,
#     :red     => 1, :light_red      => 61,
#     :green   => 2, :light_green    => 62,
#     :yellow  => 3, :light_yellow   => 63,
#     :blue    => 4, :light_blue     => 64,
#     :magenta => 5, :light_magenta  => 65,
#     :cyan    => 6, :light_cyan     => 66,
#     :white   => 7, :light_white    => 67,
#     :default => 9
#   }

module Tobi
  module Log

    def self.warn(str)
      puts  "Warning: #{str}\n".yellow 
      # if IS_WIN32 == true
      #   puts msg.colorize(:yellow)
      # else
      #   puts msg
      # end
    end

  end
end