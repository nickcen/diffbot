#! /usr/bin/env ruby
$: << '../lib'
require 'diffbot'
require 'yaml'
Diffbot::API.token = YAML.load_file('token.yml')['token']