require 'jekyll'

# include lookup_variable
# @see https://www.rubydoc.info/gems/jekyll/3.1.1/Jekyll%2FLiquidExtensions:lookup_variable
include Jekyll::LiquidExtensions

module Tobi
  module Common

    private
      # Markup regex
      # Separate path and parameters
      MARKUP_REGEX = /(?<path>[^"'\|\s]+|"[^"]+"|'[^']+')(?<params>.*)/i

      # For interpoaltion, look for liquid variables
      LIQUID_VARIABLE = /\{\{\s*([\w.\-]+)\s*\}\}/i

      # Liquid parameter parser 
      PARAM_REGEX = /([\w-]+)\s*=\s*(?:"([^"\\]*(?:\\.[^"\\]*)*)"|'([^'\\]*(?:\\.[^'\\]*)*)'|([\w\.-]+))/

      PARAM_REMOVER_REGEX = /([\w-]+\s*=\s*)("[^"\\]*(?:\\.[^"\\]*)*"|'[^'\\]*(?:\\.[^'\\]*)*'|[\w\.-]+)/

      IMAGE_CAPTION = /(?:"([^"\\]*(?:\\.[^"\\]*)*)"|'([^'\\]*(?:\\.[^'\\]*)*)'|([\w\.\-#]+))/


    # Parse markup https://www.rubydoc.info/github/mojombo/jekyll/Jekyll/Tags/IncludeTag
    # Markup is always with first <path> and then <parameters>
    def self.parse_markup(markup, tagName) 
      match = markup.strip.match(MARKUP_REGEX)
      if !match
        raise SyntaxError, [
        "Syntax Error in tag #{tagName} while parsing the following markup:",
        "\"#{markup}\"",        
        "Valid syntax: {% svg <path/to/file *OR* filename> %}",
        ].join("\n\r") + "\n\r";
      end
      path = match['path'].sub(/^["']/,"").sub(/["']$/, "").strip;
      params = match["params"].strip

      return path, params;
    end

    # Search for Liquid variables from given markup to context and interpolate it
    # Example: User gives {% svg {{ variable }} %}. 
    # Then we need to check and parse the variable from Jekyll Context 
    def self.interpolate(markup, context)
      markup.scan LIQUID_VARIABLE do |variable|
        markup = markup.sub(LIQUID_VARIABLE, lookup_variable(context, variable.first))
      end
      markup
    end

    # Add file to jekyll dependencies path
    def self.add_file_to_dependency(site, path, context)
      if context.registers[:page] && context.registers[:page].key?("path")
        site.regenerator.add_dependency(
          site.in_source_dir(context.registers[:page]["path"]),
          path
        )
      end
    end

    def self.sanitized_path(path, site, context)
      sanitizedPath = Jekyll.sanitized_path(site.source, interpolate(path, context))
      # unless sanitizedPath
      #   raise Exception, <<~END
      #   Failed to sanitize path:
      #   #{path}
      #   Check if the path is relative to your Jekyll project.
      #   END
      # end
      return sanitizedPath
    end

    def self.split_params(markup, context)
      params={}
      count = 0
      while (match = PARAM_REGEX.match(markup))
        markup = markup[match.end(0)..-1]
        value = if match[2]
          interpolate(match[2].gsub(%r!\\"!, '"'), context)
        elsif match[3]
          interpolate(match[3].gsub(%r!\\'!, "'"), context)
        elsif match[4]
          match[4]
        end
        if (value != nil && value.is_a?(String)) 
          value = value.strip
          value = lookup_variable(context, value)
          params[match[1]] = value
          count += 1
        end
      end
      return params, count
      
    end

    def self.remove_params(markup)
      str = markup.dup
      while (match = PARAM_REMOVER_REGEX.match(markup))
        str.gsub!(match.to_s(), '');
        markup = markup[match.end(0)..-1]
      end
      return str
    end

    def self.validate_url(url)
      regex = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*)/i
      return (url =~ regex)
    end

    def self.get_caption(markup)
      if markup && markup.length > 0
        str = self.remove_params(markup)
        match = IMAGE_CAPTION.match(str)
        if match && match.length > 1
            caption = match[1]
            if caption && caption.length > 0
              return caption.strip
            end
            return -1;
        end
      end
      return -2;
    end

  end
end