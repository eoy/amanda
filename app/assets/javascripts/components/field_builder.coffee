DOM = React.DOM

window.FieldBuilder = React.createClass
  getInitialState: ->
    {
      title: ""
      type: "string"
    }

  titleChanged: (event) ->
    @setState(title: event.target.value)
    console.log @state.title
    json_data = JSON.stringify([
      {
        "#{@state.title}": @state.type
      }
    ])
    $('#entry_group_fields').val json_data

  typeChanged: (event) ->
    @setState(type: event.target.value)

  addClicked: (event) ->
    alert "Adding new field"

  formSubmitted: (event) ->
    event.preventDefault()
    json_data = JSON.stringify([
      {
        "#{@state.title}": @state.type
      }
    ])
    $('#entry_group_fields').val json_data

  render: ->
    DOM.form
      className: "form-horizontal",
      #onBlur: @formSubmitted,
      #onSubmit: @formSubmitted,
      DOM.fieldset null,
        DOM.legend null, "Fields"
        DOM.div
          className: "field-row row"
          DOM.div
            className: "medium-6 columns"
            DOM.input
              id: "title"
              value: @state.title
              onChange: @titleChanged
              placeholder: "Field name"
              type: "text"
          DOM.div
            className: "medium-6 columns"
            DOM.select
              className: ""
              id: "type"
              value: @state.type
              onChange: @typeChanged
              placeholder: "Field type"
              DOM.option
                value: "string"
                "String"
              DOM.option
                value: "text"
                "Text"
              DOM.option
                value: "email"
                "Email"
              DOM.option
                value: "file"
                "File"
          DOM.div
            DOM.a
              href: "#"
              onClick: @addClicked
              "Add new field"
            DOM.input
              type: "submit"