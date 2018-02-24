module Jekyll
    class PseudoCodeEndPlugin < Liquid::Tag
  
      def initialize(tag_name, text, tokens)
        super
        @text = text
      end
  
      def render(context)
        final = "</code>"
        final << "</pre>"
        final << "</figure>"
        "#{final}"
      end
    end
  end
  Liquid::Template.register_tag('tendpseudo',Jekyll::PseudoCodeEndPlugin)
  