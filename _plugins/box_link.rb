module Jekyll
  class BoxLink < Liquid::Tag

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

      # arguments: link, legend, inside text
      final = ""

      if size >= 1

        # link
        final = "<div class=\"box\">"
        final << "<a class=\"box-link\" href=\"#{kind[0]}\" target=\"_blank\">"

        # box name
        if size >= 3
          if kind[2].length >= 3
            final << kind[2]
          else
            final << "Download"
          end
        else
          final << "Download"
        end

        final << "</a>"

        # description
        if size >= 2
          final << kind[1];
        end

        final << "</div>"

      end

      "#{final}"
    end
  end
end
Liquid::Template.register_tag('boxlink',Jekyll::BoxLink)
