module QuestionTypeHelper

  def self.render(type,name)
    "admin/#{type}/#{name}/create.js.erb"
  end

end
