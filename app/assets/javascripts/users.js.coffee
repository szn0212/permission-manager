# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $("input[name=role]").click ->
        ids = ""
        $("input[name=role]:checked").each ->
            ids += $(this).attr('role_id') + ','
        params = "ids=" + ids
        $.post '/roles/permissions', params, (data) ->
            $("input[name=permission]").prop('checked',false)
            for p in data.permissions
                $("#permission_"+p.id).prop('checked',true)
        ,'json'

    $("input[name=role]").each ->
        $(this).attr('old-checked',$(this).prop('checked'))

    $("#btnAssignRolesToUser").click ->
        user_id = $(this).attr('user_id')
        news = ""
        deleteds = ""
        $("input[name=role]").each ->
            role_id = $(this).attr('role_id')
            old = $(this).attr('old-checked')
            now = $(this).prop('checked')
            return if old == now.toString()
            news += role_id + ',' if now
            deleteds += role_id + ',' if !now
        params = {
            'news': news, 'deleteds': deleteds, 'user_id': user_id
        }
        $.post '/users/assign_roles', params, (data) ->
            showMessage(data.message)
            location.reload if !data.success
        ,'json'
