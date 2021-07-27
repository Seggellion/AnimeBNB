module SvgHelper
#  def show_svg(path)
#    File.open("app/assets/images/#{path}", "rb") do |file|
#     raw file.read
#    end
#  end
def show_svg(icon_name, options={})
  file = File.read(Rails.root.join('app', 'assets', 'images', "#{icon_name}.svg"))
  doc = Nokogiri::HTML::DocumentFragment.parse file
  svg = doc.at_css 'svg'

  options.each {|attr, value| svg[attr.to_s] = value}

  doc.to_html.html_safe
end
  #def icon(path, css_class: "")
#    content_tag(:svg, class: "icon icon_#{path} #{css_class}") do
#      content_tag(:use, nil, 'xlink:href' => "#icon_#{path}")
#    end
#  end
end
