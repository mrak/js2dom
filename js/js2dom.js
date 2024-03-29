// Generated by CoffeeScript 1.3.3
(function() {
  var fromArray, generateAttributes, isArray, isAttribute, isBaseType, js2html, js2xhtml, tagIsUnary;

  fromArray = function(array, js2x) {
    var el, html, _i, _len;
    if (js2x == null) {
      js2x = js2html;
    }
    html = '';
    for (_i = 0, _len = array.length; _i < _len; _i++) {
      el = array[_i];
      html += js2x(el);
    }
    return html;
  };

  generateAttributes = function(el) {
    var attributes, name, value;
    attributes = '';
    for (name in el) {
      value = el[name];
      name = name.toLowerCase();
      if (isAttribute(name)) {
        attributes += ' ' + name + '="' + value + '"';
      }
    }
    return attributes;
  };

  isAttribute = function(property) {
    return property !== 'tag' && property !== 'content';
  };

  isBaseType = function(obj) {
    var _ref;
    return (_ref = typeof obj) === 'string' || _ref === 'number';
  };

  isArray = function(obj) {
    return obj instanceof Array;
  };

  tagIsUnary = function(tag) {
    return tag === 'area' || tag === 'base' || tag === 'br' || tag === 'col' || tag === 'command' || tag === 'embed' || tag === 'hr' || tag === 'img' || tag === 'input' || tag === 'link' || tag === 'meta' || tag === 'param' || tag === 'source';
  };

  js2html = function(element) {
    var html;
    if (typeof element === 'function') {
      return '';
    }
    element = element || '';
    if (isBaseType(element)) {
      return element;
    }
    if (isArray(element)) {
      return fromArray(element);
    }
    if (!element.tag) {
      element.tag = 'div';
    }
    element.tag = element.tag.toLowerCase();
    html = '<' + element.tag;
    html += generateAttributes(element);
    html += '>';
    if (tagIsUnary(element.tag)) {
      return html;
    }
    if (element.content) {
      html += js2html(element.content);
    }
    html += '</' + element.tag + '>';
    return html;
  };

  js2xhtml = function(element) {
    var html;
    if (typeof element === 'function') {
      return '';
    }
    element = element || '';
    if (isBaseType(element)) {
      return element;
    }
    if (isArray(element)) {
      return fromArray(element, js2xhtml);
    }
    if (!element.tag) {
      element.tag = 'div';
    }
    element.tag = element.tag.toLowerCase();
    html = '<' + element.tag;
    html += generateAttributes(element);
    if (tagIsUnary(element.tag)) {
      return html += ' />';
    }
    html += '>';
    if (element.content) {
      html += js2xhtml(element.content);
    }
    html += '</' + element.tag + '>';
    return html;
  };

  if (typeof exports !== "undefined" && exports !== null) {
    exports.js2html = js2html;
  }

  if (typeof exports !== "undefined" && exports !== null) {
    exports.js2xhtml = js2xhtml;
  }

  if (typeof window !== "undefined" && window !== null) {
    window.js2html = js2html;
  }

  if (typeof window !== "undefined" && window !== null) {
    window.js2xhtml = js2xhtml;
  }

}).call(this);
