class Ecard
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  include ActiveModel::Model

  attr_accessor :content, :width, :height, :title, :src, :link, :alt, :date, :text, :color_template, :date_event, :community_event, :name_link_event, :link_event

  def persisted?
    false
  end

  def content
    template = Haml::Engine.new(File.read('config/templates/template.haml'))
    template.render(Object.new, :@title => @title,
                                :@color_template => @color_template,
                                :@link => @link,
                                :main_image_text => main_image_text,
                                :other_events_link => other_events_link)
  end

  def main_image_text
    Haml::Engine.new(File.read('config/templates/_image_text.haml')).render(Object.new, :@src => @src, :@alt => @alt, :@date => @date, :@text => @text)
  end

  def other_events_link
    Haml::Engine.new(File.read('config/templates/_other_events_link.haml')).render(Object.new, :@date_event => @date_event,
                                                                                               :@community_event => @community_event,
                                                                                               :@link_event => @link_event,
                                                                                               :@name_link_event => @name_link_event,
                                                                                               :@color_template => @color_template)
  end

  # def forward_to_a_friend?
  #   forward_to_a_friend == "0" ? false : true
  # end

  def write_on_file
    path = 'public/ecard.html'
    File.open(path, 'w') do |f|
      f.write content
    end
  end
end
