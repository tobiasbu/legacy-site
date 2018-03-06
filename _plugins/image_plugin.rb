module Jekyll
  class ImagePlugin < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)


       #.delete('|')

      kind = @text

      if kind[0] == ' '
        kind = kind.slice(1..-1)
      end

      kind = @text.squeeze(" ")
      kind = kind.strip;
      kind = kind.split('\0');
      size = kind.size
      final = ""
      style = false

      if size >= 1

        final = "<div class=\"center-area\">"

          #if size == 2
          #    final << " style=\"margin: 2em 0 0.5em\">"
          #else
            #final << "margin: 2em 0\">"
            #kind[1] = kind[1].encode("iso-8859-1").force_encoding("cp1252").encode('utf-8')
          #end
          if size >= 3
            if kind[2].length > 5
              style = true
            end
          end

          final << "<img style src=\"#{context.registers[:site].config['baseurl']}/img#{kind[0]}\""


          if style
            final << " style=\"#{kind[2]}\""
          end

          final << ">"

        if size >= 2
          if kind[1].length > 2
          site = context.registers[:site]
          converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
          final << "<p>" #style=\"font-style:italic; color:#656565; text-align: center; margin:0 0 2em;
          final << "#{converter.convert(kind[1])}"
          final << "</p>"
          end
        end

        final << "</div>"
      end


      #{}"the text #{@text}"
      #{}"the kind:-#{kind}-#{kind.size}"
      #{}"#{context.registers[:site].config['baseurl']}"
      "#{final}"
    end
  end
end
Liquid::Template.register_tag('image',Jekyll::ImagePlugin)
