require_relative 'config/bootstrap'

namespace :import do
  desc "import data from snapshot"
  task :snapshot, [:snapshot_path] do |t, args|
    require 'time'
    snapshot = JSON.parse(File.read(args[:snapshot_path]))
    DB.transaction do
      DB[:courses] = snapshot['courses'].map do |course_snapshot|
        course_snapshot['created_at'] = Time.parse(course_snapshot['created_at'])
        course_snapshot['updated_at'] = Time.parse(course_snapshot['updated_at'])
        Course.new(course_snapshot)
      end
    end
  end
end
