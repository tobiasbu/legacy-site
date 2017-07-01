module Jekyll
  class Hello < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{Time.now}"
    end
  end
end
Liquid::Template.register_tag('hello',Jekyll::Hello)
