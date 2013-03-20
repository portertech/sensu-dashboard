namespace 'SensuDashboard.Views.Stashes', (exports) ->

  class exports.ListItem extends SensuDashboard.Views.ListItem

    name: 'stashes/list_item'

    className: ->
      @model.get('status_name')

    events:
      'click td:not(.select)': 'showDetails'
      'click input[type=checkbox]': 'toggleSelect'

    render: ->
      @$el.html(@template(@presenter()))
      this

    presenter: ->
      _.extend(@model.toJSON(), {
        key_list: Object.keys(@model.attributes).join(', ')
      })

    toggleSelect: ->
      @model.set(selected: !@model.get('selected'))

    showDetails: ->
      new SensuDashboard.Views.Stashes.Modal
        name: 'stashes/modal'
        model: @model
