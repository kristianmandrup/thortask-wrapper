# Thorwrapper ##

## Installation ##

`$ thor install thorwrapper`

## Run ##

Iterate installed thor tasks and create bash wrappers in binaries folder

`$ thor thorwrapper`

Installs binaries to `~/binaries` by default if no destination argument given. 
                            
`$ thor thorwrapper ~/my-binaries`

Installs binaries to to destination `~/my-binaries`

## Usage: load for each terminal session ##

`$ mate ~/.bash_profile`

<pre>
# add similar lines to .bash_profile to load bash scripts  
load 'git'
load 'rails'

# utility function to load binary
load() {
  source "~/binaries/$1.sh"  
}

Open new terminal session

`$ git_project my_proj --return`

`$ gem_project my_gem_proj --return`

</pre>

## Usage: load wrappers when needed ##

`$ load git`
            
`$ git_project my_proj --return`

`$ git_update --return`

`$ load gem`
            
`$ gem_project my_gem_proj --return`

`$ gem_publish`

## Copyright info #

See License