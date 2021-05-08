require_relative "common"
require_relative "log"

module Jekyll
  class Video < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @address, @params = Tobi::Common.parse_markup(markup, 'video')
    end

    def render(context)

      if !Tobi::Common.validate_url(@address)
        Tobi::Log.warn("Invalid URL address:\n#{@address}")
        return
      end


      isWide = false
      if @params && @params.length > 0
        if (@params == "wide" || @params == "w")
          isWide = true
        end
      end

      final = "<div class=\"video-container#{(isWide ? " wide" : "")}\">"
      final << "<iframe src=\"#{@address}\""

      if isWide == true
        final << " width=\"560\" height=\"315\" allowFullScreen=\"true\" style=\"border:none; overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" "
      else
        final << " width=\"640\" height=\"480\" frameborder=\"0\" allowfullscreen=\"true\""
      end

      final << "></iframe>"
      final << "</div>"

      "#{final}"
    end
  end
end
Liquid::Template.register_tag('video',Jekyll::Video)
