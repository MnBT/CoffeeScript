define(
  [
    'text!template/speakersStoriesTpl.htm'
    'views/SpeakerView'
    'backbone'
  ]
(
  speakersStoriesTpl
  SpeakerView
) ->
  class SpeakerCollectionView extends Backbone.View
    tagName: 'section'
    template: _.template(speakersStoriesTpl)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      data = _.extend(@options, @options.description)
      @$el.empty().append(@template(data))

      @collection.each( (speaker) =>
        @addOne(speaker)
      )
      @

    addOne: (speaker) ->
      speakerView = new SpeakerView({model: speaker})
      @$el.append(speakerView.render().$el)
)