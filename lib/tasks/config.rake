# frozen_string_literal: true

namespace :app do
  desc 'Copy figaro configuration file'
  task :config do
    example = File.join('config', 'application.example.yml')
    target = File.join('config', 'application.yml')
    sh "rm -f #{target}" if File.file?(example)
    cp example, target, verbose: true
  end
end
