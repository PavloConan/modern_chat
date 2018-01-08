class ComponentGenerator < Rails::Generators::Base
  argument :component_name, required: true

  def create_view_file
    create_file "#{component_path}/#{component_name}.html.haml"
  end

  def create_css_file
    create_file "#{component_path}/#{component_name}.css"
  end

  def create_js_file
    create_file "#{component_path}/#{component_name}.js" do
      "import \"./#{component_name}.css\";\n"
    end
  end

  protected

  def component_path
    "frontend/components/#{component_name}"
  end

end
