/**
 * Created by sealtech on 05.04.2017.
 */
$(document).ready(function () {
    function PrepareLink(field, value) {
        var link = "";
        switch (field) {
            case "language":
                link = "/?Language=" + value + "&searchString=" + searchString + "&page=" + page + "&Sort=" + sort;
                break;
            case "searchString":
                link = "/?Language=" + language + "&searchString=" + value + "&page=" + page + "&Sort=" + sort;
                break;
            case "page":
                link = "/?Language=" + language + "&searchString=" + searchString + "&page=" + value + "&Sort=" + sort;
                break;
            case "sort":
                link = "/?Language=" + language + "&searchString=" + searchString + "&page=" + page + "&Sort=" + value;
                break;
        }
        return prepareTypes(link);

    }

    function prepareTypes(link) {
        $(".types-group").find("input[type='checkbox']:checked").each(function (index) {
            link += "&Types["+index+"]=" + $(this).attr("name");
        });
        return link;
    }

    $(".action-link").click(function () {
        var field = $(this).attr("data-field");
        var value = $(this).attr("data-value");
        document.location = PrepareLink(field, value);
        return false;
    });
    $(".action-button").click(function () {
        var item = $("#" + $(this).attr("data-input"));
        var field = item.attr("name");
        var value = item.val();
        document.location = PrepareLink(field,value);
      return false;
    });
    //highlight
    $(".search-item").click(function(){
        var th= $(this);
        $(".search-item").each(function(){
            $(this).removeClass("active");
        });
        th.addClass("active");
    })

});