class Ecard
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  include ActiveModel::Model

  attr_accessor :content, :brand, :lang, :forward_to_a_friend, :width, :height, :title, :pre_header, :src, :link, :alt, :cmp

	def persisted?
  	false
	end

  # bisogna cambiare la logica che c'era in ERB
  # per lo HAML provare a linkare direttamente il partial che serve.

  def content
    # haml_template = File.read('config/templates/_pre_header.html.haml')
    # template_engine = Haml::Engine.new(haml_template)
    # template = template_engine.render(self)
    template = Haml::Engine.new(File.read("config/templates/template.html.haml"))
    pre_header_template = Haml::Engine.new(File.read("config/templates/_pre_header.html.haml")).render
    template.render
  end

  def image_link_template
    image_link_template = Haml::Engine.new(File.read("config/templates/_image_link.html.haml")).render
  end

  def no_image_link_template
    no_image_link_template = Haml::Engine.new(File.read("config/templates/_no_image_link.html.haml")).render
  end

  def write_on_file
    path = "public/ecard.html"
    File.open(path, "w") do |f|
      f.write content
    end
  end

  def forward_to_a_friend?
    forward_to_a_friend == "0" ? false : true
  end
end
