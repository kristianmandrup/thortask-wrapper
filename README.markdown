# Thorwrapper ##

## Installation ##

`$ thor install thorwrapper`

## Run ##

Iterate installed thor tasks and create bash wrappers in binaries folder

`$ thor thorwrapper`

Generates executable shell script wrappers. The scripts are placed in the default destination `~/binaries`. 
                            
`$ thor thorwrapper ~/my-binaries`

Generates executable shell script wrappers. The scripts are placed in the destination `~/my-binaries`

`$ thor thorwrapper --tasks git gem`

Generates executable shell script wrappers for the 'git' and 'gem' tasks. 
Scripts are placed in the destination `~/my-binaries`

## Usage: bash_profile config #
<pre>
# utility function to load binary
load() {
  source "~/binaries/$1.sh"  
}
</pre>

## Usage: auto-load wrapper functions for terminal session ##

To auto-load the shell scripts and thus the wrapper functions for each terminal session.

`$ mate ~/.bash_profile`

<pre>
# add lines to .bash_profile to load bash scripts  
load 'git'
load 'rails'

Open new terminal session. The scripts are auto-loaded and immediately all accessible.

`$ git_project my_proj --return`

`$ gem_project my_gem_proj --return`

</pre>

## Usage: load wrapper functions when needed ##

`$ load git`
            
`$ git_project my_proj --return`

`$ git_update --return`

<pre>
$ gem_publish
=> ERROR (gem script not yet loaded!)
</pre> 

`$ load gem`
            
`$ gem_project my_gem_proj --return`

`$ gem_publish`

## TODO #

Suggestions are welcome!

## Copyright info #

See License