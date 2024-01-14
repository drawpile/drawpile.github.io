#!/usr/bin/env ruby
# SPDX-License-Identifier: MIT
require 'find'
require 'pathname'
require 'yaml'

def is_translation?(name)
  return name =~ /\A.+\.[a-z]{2}_[A-Z]{2}\.[^\.]+\z/
end

def extract_title(path)
  content = IO.read(path)
  title = nil
  if content =~ /^-{3,}\s*\n(.*?)\s*^-{3,}/msu
    title = YAML.safe_load($1, permitted_classes: [Time])['title']
  else
    warn("No YAML frontmatter in '#{path}'")
  end
  return title || File.basename(path)
end

def to_link(path)
  rel = Pathname.new(path).relative_path_from(__dir__).to_s().sub(/\.\w+\z/, '')
  return "/#{rel}"
end

categories = [
  {:key => 'common', :title => 'Common Topics'},
  {:key => 'draw', :title => 'Drawing and Tools'},
  {:key => 'server', :title => 'Server Hosting'},
  {:key => 'tech', :title => 'Technical Issues'},
  {:key => 'development', :title => 'Development'},
]

articles = {}
for category in categories
  articles[category[:key]] = []
end

Find.find(File.join(__dir__, 'help')) do |path|
  if FileTest.file?(path)
    name = File.basename(path)
    if !is_translation?(name) && name !~ /\Aindex\./
      category = File.basename(File.dirname(path))
      articles[category].push({
        :path => path,
        :title => extract_title(path),
        :link => to_link(path),
      })
    end
  end
end

menu = File.open(File.join(__dir__, '_includes/help/menu.html'), mode: 'w')
all = File.open(File.join(__dir__, '_includes/help/all.html'), mode: 'w')
all.puts(%q(<ul>))

for category in categories
  index = File.open(File.join(__dir__, "_includes/help/#{category[:key]}.html"), mode: 'w')

  menu.puts(%Q(<p class="menu-label"><a href="/help/#{category[:key]}"{% if page.url == '/help/#{category[:key]}/' %} class="is-active"{% endif %}>#{category[:title]}</a></p>))
  all.puts(%Q(<li><a href="/help/#{category[:key]}">#{category[:title]}</a></li>))

  menu.puts(%q(<ul class="menu-list">))
  index.puts(%q(<ul>))
  all.puts(%q(<ul>))

  for article in articles[category[:key]].sort_by {|a| a[:title] }
    menu.puts(%Q(  <li><a href="#{article[:link]}"{% if page.url == '#{article[:link]}.html' %} class="is-active"{% endif %}>#{article[:title]}</a></li>))
    all.puts(%Q(  <li><a href="#{article[:link]}">#{article[:title]}</a></li>))
    index.puts(%Q(  <li><a href="#{article[:link]}">#{article[:title]}</a></li>))
  end

  menu.puts(%q(</ul>))
  all.puts(%q(</ul>))
  index.puts(%q(</ul>))
  index.close()
end

all.puts(%q(</ul>))
all.close()
menu.close()


faqtoc = File.open(File.join(__dir__, '_includes/help/faqtoc.html'), mode: 'w')
faqtoc.puts(%q(<ul>));
faqdepth = 2
for line in IO.foreach((File.join(__dir__, '/help/common/faq.markdown')))
  if line =~ /^(#+)\s*(.+?)\s*\z/
    depth = $1.length
    title = $2
    anchor = title.gsub(/\s/, '-').gsub(/[^\w-]/, '').downcase()

    while faqdepth > depth
      faqtoc.puts(%q(</ul>))
      faqdepth -= 1
    end

    while faqdepth < depth
      faqtoc.puts(%q(<ul>))
      faqdepth += 1
    end

    faqtoc.puts(%Q(<li><a href="##{anchor}">#{title}</a></li>))
  end
end
while faqdepth > 2
  faqtoc.puts(%q(</ul>))
  faqdepth -= 1
end
faqtoc.puts(%q(</ul>));
faqtoc.close()
