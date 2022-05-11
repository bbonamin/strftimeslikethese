# frozen_string_literal: true

load 'bormashino/tasks/bormashino.rake'

desc 'packしdigestする'
task :default do
  Rake::Task['bormashino:pack'].invoke('')
  Rake::Task['bormashino:delete_wasms'].invoke(TMP)
  Rake::Task['bormashino:digest'].invoke(TMP)
end
