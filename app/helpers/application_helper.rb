module ApplicationHelper
  def embedded_svg filename, options={}
		file = File.read(Rails.root.join('app', 'assets', 'images', filename))
		doc = Nokogiri::HTML::DocumentFragment.parse file
		svg = doc.at_css 'svg'

		if options[:class].present?
			svg['class'] = options[:class]
		end

		doc.to_html.html_safe
  end

  def link_to_in_li(body, url, html_options = {})
    active = "active" if current_page?(url)
    content_tag :li, class: active do
      link_to body, url, html_options
    end
  end
end
