sut = null
describe 'js2html', ->
   beforeEach ->
      sut = require('../src/js2dom').js2html

   describe 'base types', ->
      it 'should return string as itself', ->
         expected = "a string"

         actual = sut expected

         expect(actual).toBe(expected)

      it 'should return number as number', ->
         expected = 42

         actual = sut expected

         expect(actual).toBe(expected)

      it 'should return empty string for undefined', ->
         expected = ''

         actual = sut undefined

         expect(actual).toBe(expected)

   describe 'HTML tags', ->
      it 'should generate label tag', ->
         json =
            tag: 'label'
            content: 'Purchase Order #1234567'
         expected = '<'+json.tag+'>'+json.content+'</'+json.tag+'>'

         actual = sut json

         expect(actual).toBe(expected)

      it 'should generate class attribute', ->
         json =
            tag: 'label'
            content: 'Purchase Order #1234567'
            "class": 'underlined'
         expected = '<'+json.tag+' class="underlined">'+json.content+'</'+json.tag+'>'

         actual = sut json

         expect(actual).toBe(expected)

      it 'should not generate closing tag for HTML text input', ->
         json =
            tag: 'input'
            type: 'text'
            value: '1234'
            name: 'quantity'
            id: 'quantity_id'
         expected = '<'+json.tag+' type="'+json.type+'" value="'+json.value+'" name="'+json.name+'" id="'+json.id+'">'

         actual= sut json

         expect(actual).toBe(expected)

   describe 'content within HTML tag', ->
      it 'should generate wrap', ->
         input =
            tag: 'input'
            type: 'text'
            value: '1234'
            name: 'quantity'
            id: 'quantity_id'
         json =
            "class":"control-group",
            content: input
         expected = '<div class="'+json["class"]+'">'+'<'+input.tag+' type="'+input.type+'" value="'+input.value+'" name="'+input.name+'" id="'+input.id+'">'+'</div>'

         actual = sut json

         expect(actual).toBe(expected)
describe 'js2xhtml', ->
   beforeEach ->
      sut = require('../src/js2dom').js2xhtml

   describe 'base types', ->
      it 'should return string as itself', ->
         expected = "a string"

         actual = sut expected

         expect(actual).toBe(expected)

      it 'should return number as number', ->
         expected = 42

         actual = sut expected

         expect(actual).toBe(expected)

      it 'should return empty string for undefined', ->
         expected = ''

         actual = sut undefined

         expect(actual).toBe(expected)

   describe 'HTML tags', ->
      it 'should generate label tag', ->
         json =
            tag: 'label'
            content: 'Purchase Order #1234567'
         expected = '<'+json.tag+'>'+json.content+'</'+json.tag+'>'

         actual = sut json

         expect(actual).toBe(expected)

      it 'should generate class attribute', ->
         json =
            tag: 'label'
            content: 'Purchase Order #1234567'
            "class": 'underlined'
         expected = '<'+json.tag+' class="underlined">'+json.content+'</'+json.tag+'>'

         actual = sut json

         expect(actual).toBe(expected)

      it 'should not generate closing tag for HTML text input', ->
         json =
            tag: 'input'
            type: 'text'
            value: '1234'
            name: 'quantity'
            id: 'quantity_id'
         expected = '<'+json.tag+' type="'+json.type+'" value="'+json.value+'" name="'+json.name+'" id="'+json.id+'" />'

         actual= sut json

         expect(actual).toBe(expected)

   describe 'content within HTML tag', ->
      it 'should generate wrap', ->
         input =
            tag: 'input'
            type: 'text'
            value: '1234'
            name: 'quantity'
            id: 'quantity_id'
         json =
            "class":"control-group",
            content: input
         expected = '<div class="'+json["class"]+'">'+'<'+input.tag+' type="'+input.type+'" value="'+input.value+'" name="'+input.name+'" id="'+input.id+'" />'+'</div>'

         actual = sut json

         expect(actual).toBe(expected)
