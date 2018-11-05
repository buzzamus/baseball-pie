# Baseball Pie

A Rails App For Uploading Retrosheet text files, parsing the desired data, and then presented in pie chart form.

* System dependencies:
  * chartkick gem - used to create charts
  * hightop gem - used to support chartkick gem
  * groupdate gem - used to make working with dates easier
  * postgres gem - especially necessary for timestamp handling in order to sort data out by day of week
  * tests written using rspec
