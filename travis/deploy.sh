#!/bin/bash

 openssl aes-256-cbc -K $encrypted_5d8775c46482_key -iv $encrypted_5d8775c46482_iv
  -in travis.enc -out /tmp/travis.key -d
 chmod 600 /tmp/travis.key
 mkdir /tmp/package
 cp "/tmp/build/.pioenvs/nodemcu/firmware.bin" "/tmp/package/"
 cp -r "examples/ESPmanager-example/data" "/tmp/package/"
 ls /tmp/package/
 ssh -v -p 4022 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /tmp/travis.key $HOME_USER@$HOME_IP "mkdir -p ~/projects/$TRAVIS_REPO_SLUG/latest/"
 scp -v -P 4022 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /tmp/travis.key -rp /tmp/package/. "$HOME_USER@$HOME_IP:~/projects/$TRAVIS_REPO_SLUG/latest/"  
