class Ecard
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  include ActiveModel::Model

  attr_accessor :content, :brand, :lang, :forward_to_a_friend, :width, :height, :title, :src, :link, :alt, :cmp, :title_event, :desc_event, :link_event

	def persisted?
  	false
	end

  def content
    template = Haml::Engine.new(File.read("config/templates/template.haml"))
    template.render(Object.new, { :@title => @title,
                                  :main_image_text => main_image_text,
                                  :other_events_link =>other_events_link })
  end

  def main_image_text
    Haml::Engine.new(File.read("config/templates/_image_text.haml")).render(Object.new, :@src => @src)
  end

  def other_events_link
    Haml::Engine.new(File.read("config/templates/_other_events_link.haml")).render(Object.new, :@title_event => @title_event, :@desc_event => @desc_event, :@link_event => @link_event)
  end

  # def forward_to_a_friend?
  #   forward_to_a_friend == "0" ? false : true
  # end

  def write_on_file
    path = "public/ecard.html"
    File.open(path, "w") do |f|
      f.write content
    end
  end

end
