source 'https://rubygems.org'

puppetversions = []
if ENV.key?('PUPPET_VERSION')
  puppetversions = ENV['PUPPET_VERSION'].split(',').map(&:strip)
end

gem 'puppet', puppetversions
gem 'puppet-henchman'
gem 'kitchen-vagrant'

gem 'puppet-lint'
gem 'puppet-syntax'
gem 'metadata-json-lint'
gem 'rspec-puppet-facts'
