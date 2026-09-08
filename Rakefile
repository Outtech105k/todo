# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "yard"

YARD::Rake::YardocTask.new
Minitest::TestTask.create

require "standard/rake"

task default: %i[test standard]
