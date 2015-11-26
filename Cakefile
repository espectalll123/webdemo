exec = require('child_process').execSync

task 'build', 'Compile stuff', ->
        exec 'coffee -c --no-header -o tmp js/index.coffee'
        exec 'uglifyjs tmp/index.js -c -m --screw-ie8 -o js/index.js'

# I know this code is crap. I may change it... one day...
