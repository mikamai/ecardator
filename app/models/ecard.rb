class Ecard
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  include ActiveModel::Model

  attr_accessor :content, :brand, :lang, :forward_to_a_friend, :width, :height, :title, :pre_header, :src, :link, :alt, :cmp

	def persisted?
  	false
	end

  # STRUTTURA BASE
  # haml_template = File.read('config/templates/_pre_header.html.haml')
  # template_engine = Haml::Engine.new(haml_template)
  # template = template_engine.render

  def content
    template = Haml::Engine.new(File.read("config/templates/template.haml"))
    template.render(Object.new, { :@title => @title, :pre_header_template => pre_header_template })
  end

  def pre_header_template
    Haml::Engine.new(File.read("config/templates/_pre_header.haml")).render(Object.new, :@pre_header => @pre_header)
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
