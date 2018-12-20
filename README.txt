
 vagrant up
 vagrant ssh
 vagrant provision
 vagrant reload

Put your github username in ./config/github_username

The ssh agent forwards, so your github keys should be loaded. Check them: `ssh-add -L`

== TODO ==
* ~/.bash_profile doens't have $rbenv_root interpolated
* ~/.bash_profile should belong to vagrant user

