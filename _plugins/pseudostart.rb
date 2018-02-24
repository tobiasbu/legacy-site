module Jekyll
    class PseudoCodeStartPlugin < Liquid::Tag
  
      def initialize(tag_name, text, tokens)
        super
        @text = text
      end
  
      def render(context)
        final = "<figure class=\"pseudo-code\">"
        final << "<pre>"
        final << "<code>"
        "#{final}"
      end
    end
  end
  Liquid::Template.register_tag('tpseudo',Jekyll::PseudoCodeStartPlugin)
  