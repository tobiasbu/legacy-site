module Jekyll
    class GitBox < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text
        end
      

        def render(context)

            url = @text
            source_dir = context.registers[:site].source
            path = source_dir + "/_svg/github.svg" #{context.registers[:site]
            
            contents = File.open(path, "rb") { |f| f.read }
            #contents = file.read
            #file.close

            
            final = "<div class=\"box\">"
            final << "<a class=\"box-link\" href=\"#{url}\" target=\"_blank\" >"
            final << "#{contents}";
            
            final << "<span>Get source code</span>"
            final << "</a>"
            final << "</div>"

        end

    end
end

Liquid::Template.register_tag('gitbox',Jekyll::GitBox)