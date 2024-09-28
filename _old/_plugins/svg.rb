
require_relative "common"

module Jekyll
  module Tags
    class InlineSvg < Liquid::Tag
      # import lookup_variable
      include Jekyll::LiquidExtensions

      # Initialize Plugin
      def initialize(tag_name, markup, tokens)
        super
        @svg, @params = Tobi::Common.parse_markup(markup, 'svg')
      end

      def split_params(params)
        params={}
      end

      def render(context)

        # inline svg config (_config.yml)
        config = lookup_variable(context,"site.svg")
        svgPath = ""
        if config["base_path"]
          svgPath = config["base_path"].dup
          if svgPath[-1, 1] != '/' # check last char
            svgPath << '/'
            if @svg[0,1] == '/' # check first char
              @svg = @svg[1..-1]
            end
          end

        end

        svgPath << @svg

        # jekyll site
        site = context.registers[:site]
        # check if given SVG file path is a variable (like {{ icon.svg }} ). Otherwise use it as a file name
        svgPath = Jekyll.sanitized_path(site.source, Tobi::Common.interpolate(svgPath, context))
        return unless svgPath
        Tobi::Common.add_file_to_dependency(site, svgPath, context)

        file = File.open(svgPath, "rb") { |f| f.read }

        if config["lookup"] == true
          file = Tobi::Common.interpolate(file, context)
        end

        "#{file}"

      end

    end
  end
end

Liquid::Template.register_tag('svg', Jekyll::Tags::InlineSvg)