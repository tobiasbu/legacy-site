require_relative "common"
require_relative "log"

module Jekyll
  class ImagePlugin < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @img, @params = Tobi::Common.parse_markup(markup, 'image')
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
        caption = Tobi::Common.get_caption(@params)
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

      final << "<img src=\"\/img#{@img}\" "

      if params["alt"]
        imageAlt = params["alt"]
      elsif caption.is_a?(String)
        imageAlt = "#{caption}"
      end

      if imageAlt
        final << "alt=\"#{imageAlt}\" "
      end

      final << "/>"
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
