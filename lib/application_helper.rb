module ApplicationHelper
  def google_font_link_tag(family, types)
    tag('link', {:rel => :stylesheet,
                 :type => 'text/css',
                 :href => "http://fonts.googleapis.com/css?family=#{family}:#{types.join(',')}"
                },
        false)
  end
end