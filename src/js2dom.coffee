fromArray = (array, js2x) ->
   js2x ?= js2html
   html = ''
   for el in array
      html += js2x el
   return html

generateAttributes = (el) ->
   attributes = ''
   for name,value of el
      name = name.toLowerCase()
      if isAttribute name
         attributes += ' ' + name + '="' + value + '"'
   return attributes

isAttribute = (property) ->
   property isnt 'tag' and property isnt 'content'

isBaseType = (obj) ->
   typeof(obj) in ['string', 'number']

isArray = (obj) ->
   obj instanceof Array

tagIsUnary = (tag) ->
   tag in [
      'area'
      'base'
      'br'
      'col'
      'command'
      'embed'
      'hr'
      'img'
      'input'
      'link'
      'meta'
      'param'
      'source'
   ]

js2html = (element) ->
   if typeof element is 'function' then return ''
   element = element or ''

   if isBaseType(element) then return element
   if isArray element then return fromArray element

   unless element.tag then element.tag = 'div'
   element.tag = element.tag.toLowerCase()

   html = '<' + element.tag
   html += generateAttributes(element)

   html += '>'
   if tagIsUnary(element.tag) then return html

   if element.content then html += js2html element.content
   html += '</' + element.tag + '>'

   return html

js2xhtml = (element) ->
   if typeof element is 'function' then return ''
   element = element or ''

   if isBaseType(element) then return element
   if isArray element then return fromArray element, js2xhtml

   unless element.tag then element.tag = 'div'
   element.tag = element.tag.toLowerCase()

   html = '<' + element.tag
   html += generateAttributes(element)

   if tagIsUnary(element.tag) then return html += ' />'

   html += '>'

   if element.content then html += js2xhtml element.content
   html += '</' + element.tag + '>'

   return html

exports?.js2html = js2html
exports?.js2xhtml = js2xhtml
window?.js2html = js2html
window?.js2xhtml = js2xhtml
