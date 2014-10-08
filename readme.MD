Custom Sass function -> .png to box shadow
===

This Sass custom function takes the filename of a png image and creates, pixel for pixel, a replica of that image in CSS using multiple box shadows. It currently only works with .png files because of the image Ruby gem ([Chunky PNG](https://github.com/wvanbergen/chunky_png)) that I am using within the custom function.

##To run##

You'll need to ensure that Chunky PNG is installed on your system:

`gem install chunky_png`

Then when you compile your CSS you'll want to include the custom 'boxshadowimage' file by running this at your terminal:

`sass style.scss style.css -r ./boxshadowimage.rb`

##How to use##

Your .scss file will include the function with a call like this:

```scss
.yourClass {
    height: 1px;
    width: 1px;
    box-shadow: boxShadowImage('pathToYourImage.png');
}
```

##Example##

If you run the above code within this repo then it'll generate a `css` file with a `.invader` class which takes the `invader.png` file and converts it into a box shadow image. Load up `index.html` to take a look.

##Issues##

###Performance###
Quick tests have shown that once you get above about 100px x 100px images then the CSS file gets uncomfortably large.

Realisticaly this technique shouldn't be used in production, but it's pretty fun ;)

###Transparency###
Transparent pixels get returned as `rgb(0, 0, 0)` (black) so any image you wanted to use this for will have the best result if there's no transparent areas within it.
