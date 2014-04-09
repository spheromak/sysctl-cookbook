source 'https://rubygems.org'

# get this from git for the chefignore issues
gem 'berkshelf'

group 'develop' do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-docker', git: 'https://github.com/spheromak/kitchen-docker.git', branch: 'locale'
  gem 'rake'
  gem 'foodcritic', git: 'https://github.com/mlafeldt/foodcritic.git', branch: 'improve-rake-task'
  gem 'rubocop'
  gem 'knife-cookbook-doc'
  gem 'chefspec', '>= 3.2.0'
end
