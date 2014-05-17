$ ->

  $(document).on "change", "[data-slider]", () ->
    level = $(this).attr("data-slider")
    $(this).closest(".skill-setting").find(".level").text(level)

  $(document).on "click", ".skill-setting .remove-button", (e) ->
    e.preventDefault()
    wrapper = $(this).closest(".skill-setting")
    wrapper.find("input.destroy").attr("value", "1")
    wrapper.hide()

  $(".skill-level-search").autocomplete
    source: "/skills",
    select: (e, ui) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      fields = $($(this).data("fields").replace(regexp, time))

      fields.find("input.skill_id").val(ui.item.id)
      fields.find(".skill-name").text(ui.item.name)

      $(this).before(fields)
      $(".skills").foundation()

      $(this).val("")
      false

