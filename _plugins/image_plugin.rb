require_relative "common"
require_relative "log"

module Jekyll
  class ImagePlugin < Liquid::Tag

    IMAGE_CAPTION = /(?:"([^"\\]*(?:\\.[^"\\]*)*)"|'([^'\\]*(?:\\.[^'\\]*)*)'|([\w\.\-#]+))/

    def initialize(tag_name, markup, tokens)
      super
      @img, @params = Tobi::Common.parse_markup(markup, 'image')
    end

    def get_caption(markup)

      if markup && markup.length > 0
        str = Tobi::Common::remove_params(markup)
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

    def get_params(markup)
      VALID_SYNTAX
    end

    def render(context)

      site = context.registers[:site]
      params, count = Tobi::Common.split_params(@params, context)
      if params["caption"]
        caption = params["caption"]
      else
        caption = get_caption(@params)
      end

      containerClass = ""
      if caption.is_a?(Numeric)
        containerClass = " no-caption"
      end

      final = "<div class=\"center-container#{containerClass}\">"
      final << "<figure>"

      final << "<picture"

      # check figure size
      aux = params['size']
      if aux
        if (aux == 'm' || aux == 'med' || aux == 'medium')
          final << " class=\"medium\" ";
        elsif (aux == 's' || aux == 'sml' || aux == 'small')
          final << " class=\"small\" ";
        end
      end
        
      final << ">"
      

      final << "<img src=\"#{context.registers[:site].config['baseurl']}/img#{@img}\">"
      final << "</picture>"

      if caption.is_a?(String)
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        final << "<figcaption>"
        final << converter.convert(caption);
        final << "</figcaption>"
      elsif caption.is_a?(Numeric) && caption == -1
        Tobi::Log.warn("Could not detect caption for image:\n#{@img}")
      end

      final << "</figure>"
      final << "</div>"

      "#{final}"

    end
  end
end
Liquid::Template.register_tag('image',Jekyll::ImagePlugin)
