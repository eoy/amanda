FieldRow = React.createClass
  displayName: "FieldRow"
  render: ->
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


fieldRow = React.createFactory(FieldRow)