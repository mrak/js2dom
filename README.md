# What does it DO?

**js2dom** contains two global functions, `js2html` and `js2xhtml`, that receive a JavaScript object and attempt to spit it back out as a string of HTML.

# API

## What's the difference between js2html and js2xhtml?

`js2xhtml` closes unary tags such as `img` like `<img />` instead of `<img>`. Note that `js2html` still properly excludes unary closing tags. i.e., **img** becomes `<img>` and not `<img></img>`

```javascript
var myElement = {
   tag: 'img',
   src: 'http://my.example.com/img.jpg'
};

var html = js2xhtml(myElement);

console.log(html);
// prints '<img src="http://my.example.com/img.jpg" />'
```

```javascript
var myElement = {
   tag: 'img',
   src: 'http://my.example.com/img.jpg'
};

var html = js2html(myElement);

console.log(html);
// prints '<img src="http://my.example.com/img.jpg">'
```

## Given an object:

Returns back an HTML string with a single top-level element.

* The `tag` property identifies which HTML tag to generate. If no tag is given, `div` is assumed.
* The `content` property is another object or array of objects to be recursively interpreted.
* **All other properties** of the supplied object become attibutes of the resulting HTML tag, with their values being the attribute values.

## Given an array:

The same as if it where given an object, but returns back an HTML string with several top-level elements.

## Given a function:

Returns an empty string.

## Given anything else:

Returns what you gave it.

# Example

```javascript
var json = {
   "class":"control-group",
   content: {
      tag: 'input',
      type: 'text',
      value: '1234',
      name: 'quantity',
      id: 'quantity_id'
   }
}
var html = js2html(json);
// html = '<div class="control-group"><input type="text" value="1234" name="quantity" id="quantity_id"></div>'

```
