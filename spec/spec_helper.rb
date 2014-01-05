$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require 'rspec'
require 'diffbot'
require 'yaml'

token_yaml = YAML.load_file(File.join(File.dirname(__FILE__),'token.yml'))

Diffbot::API.token = token_yaml["token"]