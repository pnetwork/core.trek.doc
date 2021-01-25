# Trek CLI Changelog

## 1.0.0-beta9

- [add] add runtime / script commands (alpha)
- [fix] remove `name` fields from para files
- [fix] adjust para schema
- [fix] support string to boolean in workflow edge property
- [fix] bugs fix

## 1.0.0-beta8

- [fix] fix graph validator and auto-pos checking issue
- [fix] adjust auto-pos algorithm for builder 2.0 in Marvin

## 1.0.0-beta7

- [add] run ansible/shell on local machine
- [fix] graph validator and macro casting issue
- [fix] make sure workflow run after scripts ready

## 1.0.0-beta6

- [add] support terraform project
    * createterraform / initterraform / runterraform / runterraform / deployterraform
- [add] workflow with terraform script
- [add] new rule operators (`ipAddress`, `notIpAddress`, `containObjectAll`)
- [add] support loop in workflow
- [fix] connection failed when using `runblcks`
- [fix] bugs fix

## 1.0.0-beta5

- [fix] adjust extra_vars to ansible
- [fix] fix operator bugs of have and notHave

## 1.0.0-beta4

- [fix] fix incorrect default config

## 1.0.0-beta3

- [add] script project has it's own config (.trek/config.json)
- [add] new commands for script project
- init (initblcks, initansible, initshell)
- run (runblcks, runansible, runshell)
- [fix] fix some bugs about packing and deploying
- [fix] refactoring


## 1.0.0-beta2

- [fix] path issue when using script commands
- [fix] zip name from script id, not folder name


## 1.0.0-beta1

- [fix] load incorrect config when deploy script
- [fix] fix output path when pack scripts
- [add] support new operators of Marvin workflow: have, notHave

## 1.0.0-beta

- First release.
