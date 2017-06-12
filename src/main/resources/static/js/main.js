/**
 * Created by Администратор on 12.06.2017.
 */
$(document).ready(function ()
{
    $('.add_post').click(function ()
    {
        $('#body_posts').append('<tr><td><input type="text" value="" name="punkts[]" style="width: 100%;"></td><td><label class="btn btn-danger delete_js">X</label></td>'+
        '<td> <input type="file"  style="display: inline" name="files[]" id="files_1"></td></tr>');
        return false;
    });

    $("#body_posts").on("click",".delete_js",function () {
        $(this).parent().parent().remove();
        return false;
    });
    var if_count =1;


    $(".add_if").click(function () {
        if_count++;
        var  s = '<tr><td><select name="g'+if_count+'_parametr">';
        for(var i=0;i<array_of_params.length;i++)
            s+='<option>'+array_of_params[i]+'</option>';
        s+='</select></td><td><select name="g'+if_count+'_term"><option>term1</option><option>term2</option><option>term3</option><option>term4</option></select></td><td><label class="btn btn-danger delete_js">X</label></td></tr>';
        $("#add_s").append(s)
    })
    $("#add_s").on("click",".delete_js",function () {
        if_count--;
        $(this).parent().parent().remove();
        return false;
    });

 });
