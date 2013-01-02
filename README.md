Time Machine
============
Time Machine is a neat way to visualize the development of a web projected tracked with git.

Requires [phantomJS](http://phantomjs.org/) and ruby.

Arguments
---------
All of the arguments are required.

`› ruby time_machine.rb --help
Options:
       --dir, -d <s>:   Git Directory
      --file, -f <s>:   File
  --save-dir, -s <s>:   Directory where to save images
          --help, -h:   Show this message`

Example Execution
-----------------
If the project git directory is at `~/Development/Kitty` and the file you're interested in is `index.html` (in the root dir of the project directory), then the command will be:

`ruby time_machine.rb --dir ~/Development/Kitty --file index.html --save-dir ~/Desktop/Pictures/

Pictures will be saved at `~/Desktop/Pictures/`.

Making a Video
--------------
Time Machine does not yet support making a video, but to do so just use ffmpeg to do so.

`ffmpeg -f image2 -i %d.png -r 25 -sameq video.mpg`

Examples
--------
* [CS 2050 Project - Video](http://www.youtube.com/watch?v=8XBaz0RBSEk)