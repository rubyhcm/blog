module ApplicationHelper
  class HTMLwithPyments < Redcarpet::Render::HTML

    # highlight code
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  # định dạng văn bản
  def markdown(content)
    renderer = HTMLwithPyments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_hrml_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
