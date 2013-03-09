module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          "tmp/main.js": [
            "package/**/*.coffee"
          ]

    neuter:
      compile:
        files:
          'build/main.js': [
            "tmp/main.js"
          ]

    jasmine:
      pivotal:
        src: 'package/**/*.coffee'
        options:
          specs: 'spec/**/*Spec.coffee',
          helpers: 'spec/*Helper.js'

   watch:
      package:
        files: [
          "package/**/*.coffee",
        ]
        tasks: ["coffee", 'neuter']
      test:
        files: [
          "package/**/*.coffee",
          "spec/**/*.coffee",
        ]
        tasks: ["coffee", 'jasmine:pivotal:build', 'neuter']

  grunt.loadNpmTasks('grunt-neuter')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jasmine')

  grunt.registerTask 'default',
    ["coffee", 'neuter', 'watch']

  grunt.registerTask 'test',
    ["coffee", 'jasmine', 'watch']
