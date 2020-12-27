module SelectHelper
  #all options for select, create like hash, where key is name of category, value is all values
  OPTIONS ={
    test: {
    days: "days",
    months: "months",
    years: "years"
  }
  }

  def self.categories_questions(name, data)
     Category.find_by(name: name).params_config.each do |cat|
      params_hash = eval(cat)
      params = params_hash.values[0]
      questions = Category.find_by(name: name).questions
      result = questions.select{|c|c.config.select{|v|v[1] == OPTIONS[name.parameterize.underscore.to_sym][data.parameterize.underscore.to_sym]}}
    end
  end


end
