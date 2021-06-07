require_relative "common"
require_relative "log"

module Jekyll
  class ImageRowPlugin < Liquid::Block

    def initialize(tag_name, markup, tokens)
      @caption, @params = Tobi::Common.parse_markup(markup, 'image_row')
      super
    end


    def render(context)
      @text = super

      params, count = Tobi::Common.split_params(@params, context)
      if params["caption"]
        caption = params["caption"]
      else
        caption = @caption
      end

      # for some reason is adding a line to initial code
      # let's remove
      @text = @text.remove_lines(1)

      final = "<figure role=\"group\""

      if caption.is_a?(String)
        final << ">"
        final << "<div class=\"figure-row\">"
      else
        final << "class=\"figure-row\" >"
      end

      final << "#{@text}"

      if caption.is_a?(String)
        final << "</div>"
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        final << "<figcaption>"
        final << converter.convert(caption);
        final << "</figcaption>"
      end

      final << "</figure>"

      "#{final}"

    end
  end
end
Liquid::Template.register_tag('image_row',Jekyll::ImageRowPlugin)
