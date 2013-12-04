# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#  code dealing with the add task modal
# initialize the default add task modal state
$(document).on "click", ".add-task-btn", ->
  $("#task_task_list_id").val $(this).data("id")
  $("#task_has_due_date").prop "checked", false
  $("#task_duedate_1i").prop "disabled", true
  $("#task_duedate_2i").prop "disabled", true
  $("#task_duedate_3i").prop "disabled", true
  $("#submit_add_task").prop "disabled", true
  $("#task_task").val ""

# toggle the modal when disabling the due date
$(document).on "click", "#task_has_due_date", ->
  $("#task_duedate_1i").prop "disabled", (_, val) ->
    not val
  $("#task_duedate_2i").prop "disabled", (_, val) ->
    not val
  $("#task_duedate_3i").prop "disabled", (_, val) ->
    not val

# set hidden field int the share controller to be list selected
$(document).on "click", ".share-list-btn", ->
  $("#tasklist_id").val $(this).data("id")

# set hidden field in the remove modal to be list selected
$(document).on "click", ".remove-list-btn", ->
  $("#remove_list_id").val $(this).data("id")
$(document).on "click", "#remove-me", ->
  $("#remove_method").val "me"
$(document).on "click", "#remove-all", ->
  $("#remove_method").val "all"

# disable appropriately
$(document).on "change keyup paste", "#task_task", ->
  text_contet = $(this).val()
  unless text_contet is ""
    $("#submit_add_task").prop "disabled", false
  else
    $("#submit_add_task").prop "disabled", true


# code dealing with the add task list modal
$(document).on "click", ".add-tasklist-btn", ->
  $("#task_list_name").val ""
  $("#submit_add_tasklist").prop "disabled", true

$(document).on "change keyup paste", "#task_list_name", ->
  text_contet = $(this).val()
  unless text_contet is ""
    $("#submit_add_tasklist").prop "disabled", false
  else
    $("#submit_add_tasklist").prop "disabled", true

# code dealing with the share list modal 
# set hidden field int the share controller to be list selected
$(document).on "click", ".share-list-btn", ->
  $("#tasklist_id").val $(this).data("id")
  $("#email").val ""
  $("#submit_share_list").prop "disabled", true


$(document).on "change keyup paste", "#email", ->
  text_contet = $(this).val()
  # use regex to test if the email entered is valid
  if /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.test(text_contet)
    $("#submit_share_list").prop "disabled", false
  else
    $("#submit_share_list").prop "disabled", true


# check for tasks being toggled between done and not done
$(document).on "click", ".check-task-btn", ->
  $(this).parent().toggleClass "finished-task"
  $(this).children().toggleClass "glyphicon-unchecked"
  $(this).children().toggleClass "glyphicon-check"
  taskNumber = $(this).parent().attr("id").substring(4)
  $.ajax
    url: "/task_toggle"
    type: "post"
    data:
      task_id: taskNumber
    dataType: "JSON"

# popup flash messages as toast
$(document).ready ->
  $(".popup").fadeIn(400).delay(3000).fadeOut 400
