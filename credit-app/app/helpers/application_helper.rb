module ApplicationHelper

def header(text)
  content_for(:header) { text.to_s }
end

def tag_options(options, escape = true)
    tag_builder.tag_options(options, escape)
  end


end
