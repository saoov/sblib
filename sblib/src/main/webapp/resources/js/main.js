$(".menus ul li").on("click",function() {
    $(this).children("ul").stop().slideToggle()
});

