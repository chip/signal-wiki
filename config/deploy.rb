set :ubistrano, {
  :application => :wiki,
  :platform    => :rails,  # :php, :rails, :sinatra
  :repository  => 'git@github.com:winton/signal-wiki.git',
  
  :ec2 => {
    :access_key => '1GQQP5DQ76DFJ72CG5R2',
    :secret_key => 'UHPLkDA/yLRX5dBqNTuoJbfCDcz74NtPQycua4cO'
  },
  
  :production => {
    :domains => [ 'wiki.railsint.com', 'wiki.railsinteractive.com' ],
    :host    => '75.101.132.135'
  },
  
  :staging => {
    :domains => [ 'staging.wiki.railsint.com', 'staging.wiki.railsinteractive.com' ],
    :host    => '75.101.132.135'
  }
}

require 'config/ubistrano/lib/ubistrano'