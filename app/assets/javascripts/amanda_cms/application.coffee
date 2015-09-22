#= require jquery
#= require ../application


$ ->
  $('#js-field-creator #add_more').on 'click', (e) ->
    e.preventDefault();
    $fieldCopy = $('#js-field-creator .field-row:first').clone()
    $fieldCopy.find('input').val("")
    $('#js-field-creator .field-row:last').after($fieldCopy)

  $('#js-field-creator').on 'click', '.js-remove-row', (e) ->
    e.preventDefault();
    if $('.field-row').length != 1
      $(this).parents('.field-row').remove()
      $('#js-field-creator').trigger 'change'

  $('#js-field-creator').on 'keyup change', (e) ->
    json_data = ""
    temp_data = ""

    $('.field-row').each ->
      key = $(this).find('input').val();
      val = $(this).find('select').val();
      data = JSON.stringify({
        "#{key}": val
      });
      temp_data += data;
      unless $('.field-row:last')[0] is $(this)[0]
        temp_data += ","

    json_data = "[#{temp_data}]"
    $('#entry_group_fields').val(json_data);