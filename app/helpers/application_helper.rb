module ApplicationHelper
  def markdown(text)
    unless @markdown
      options = {
        filter_html: true,
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer)
    end
    @markdown.render(text).html_safe
  end

  def default_meta_tags
    {
      site: 'ボシューからはじめよ',
      reverse: true,
      title: 'ボシューからはじめよ',
      description: 'ボシューからはじめよは、イシューを投稿して、やってくれる人を募集するサービスです。',
      keywords: 'イシュー,募集,チーム開発,プログラミング',
      canonical: request.base_url + request.path,
      og: {
        title: :full_title,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        site_name: 'ボシューからはじめよ',
        description: :description,
        locale: 'ja_JP'
      }
    }
  end
end
