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

       #.delete('|')

      # args = @text

      # if args[0] == ' '
      #   args = kind.slice(1..-1)
      # end

      # args = args.squeeze(" ")
      # args = args.split('\0');
      # size = args.size

      # # arguments: video link, aspect
      # final = ""
      # wide = "";

      # if size >= 1

      #   if size > 1
      #     if args[1] == "wide" || args[1] == "wide "
      #       wide = " widevideo"
      #     else
      #       wide = ""
      #     end
      #   end

      #   final = "<div class=\"video-container#{wide}\"><iframe src=\"#{args[0]}\" "

      #   if wide == " widevideo"
      #     final << " width=\"560\" height=\"315\" allowFullScreen=\"true\" style=\"border:none; overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" "
      #   else
      #     final << " width=\"640\" height=\"480\" frameborder=\"0\" allowfullscreen=\"true\""
      #   end
      #     final << "></iframe>"

      # #<iframe src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Flaserball2016%2Fvideos%2F594284824054190%2F&show_text=0&width=560" width="560" height="315" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allowFullScreen="true"></iframe>
      #   final << "</div>"

      # end

      "#{final}"
    end
  end
end
Liquid::Template.register_tag('video',Jekyll::Video)
