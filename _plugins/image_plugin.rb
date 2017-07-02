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

      kind = kind.split('\0');

      size = kind.size

      # arguments: image, legend
      final = ""

      if size >= 1

        final = "<div class=\"center-area\">"

          #if size == 2
          #    final << " style=\"margin: 2em 0 0.5em\">"
          #else
            #final << "margin: 2em 0\">"
            #kind[1] = kind[1].encode("iso-8859-1").force_encoding("cp1252").encode('utf-8')
          #end

        final << "<img src=\"#{context.registers[:site].config['baseurl']}/img#{kind[0]}\">"

        if size == 2
          final << "<p>" #style=\"font-style:italic; color:#656565; text-align: center; margin:0 0 2em;
          final << kind[1]
          final << "</p>"
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
