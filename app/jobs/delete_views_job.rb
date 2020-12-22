class DeleteViewsJob < ApplicationJob
  queue_as :default

  def perform(args)
    name = args[:name]
    FileUtils.rm_rf(Rails.root + "app/views/admin/questions/#{name}") if File.directory?(Rails.root + "app/views/admin/questions/#{name}")
    FileUtils.rm_rf(Rails.root + "app/views/admin/answers/#{name}") if File.directory?(Rails.root + "app/views/admin/answers/#{name}")
  end
end
