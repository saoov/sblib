$(".menus ul li").on("click",function() {
    $(this).children("ul").stop().slideToggle()
});
$(".addbooks").on("click", function(){
    window.open('selectBook.html', '네이버팝업', 'width=700px,height=800px,scrollbars=no');
});

