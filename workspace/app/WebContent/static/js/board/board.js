autosize($("textarea"));

const $search = $("div.search-container input");
const $replyWrite = $("#reply-write-wrap");
const $writeButton = $("#reply-write-wrap button");
const replyTexts = ['취소', ' ', '댓글 달기'];
const $replyUpdate = $(".reply-update-wrap");
const $updateButton = $("span.update");
const $cancelButton = $("button.calcel");
const $writeTextarea = $("form[name='writeForm'] textarea");
const $upload = $("input.upload");
const $thumbnail = $("label.attach img.thumbnail");

const $checkAgree = $("input[name='agree']");

let flag = 1;

$("img.preview").each(function(i){
    if(!$(this).attr("src")){
        $(this).hide();
    }
});

$search.on("focus", function(){
    $("div.search-container").css("outline", "#eb7c78 solid 2px");
});

$search.on("blur", function(){
    $("div.search-container").css("outline", "none");
});

function showReply(){
    $replyWrite.slideToggle(function(){
        flag *= -1;
        $("#show-reply a").text(replyTexts[flag + 1]);
    });
}

$writeButton.on("mouseover", function(){
    $(this).css("background-color", "#F3F5F7");
});

$writeButton.on("mouseout", function(){
    $(this).css("background-color", "rgb(255 255 255)");
});

$updateButton.on("click", function(){
    let content = $replyUpdate.prev().text().trim();
    let $textarea = $replyUpdate.find("textarea");
    $textarea.val(content);
    $replyUpdate.prev().hide();
    $replyUpdate.next().hide();
    $replyUpdate.show();
});

$cancelButton.on("click", function(){
    $replyUpdate.hide();
    $replyUpdate.prev().show();
    $replyUpdate.next().show();
});

$writeTextarea.on("focus", function(){
    $(this).closest("span").css('border', '1px solid rgb(235 124 120)');
});

$writeTextarea.on("blur", function(){
    $(this).closest("span").css('border', '1px solid rgba(0, 0, 0, 0.1)');
});

$upload.on("change", function(e){
    let i = $upload.index($(this));
    var reader = new FileReader();
    reader.readAsDataURL(e.target.files[0]);
    reader.onload = function(e){
        let url = e.target.result;
        if(url.includes('image')){
            $("label.attach").eq(i).find("h6").hide();
            $("div.x").eq(i).show();
            $thumbnail.eq(i).show();
            $thumbnail.eq(i).attr('src', url);
        }else{
            showWarnModal("이미지 파일만 등록 가능합니다.");
        }
    }
});

$("div.x").on("click", function(e){
    e.preventDefault();
    let i = $("div.x").index($(this));
    $upload.eq(i).val("");
    $("label.attach").eq(i).find("h6").show();
    $("div.x").eq(i).hide();
    $thumbnail.eq(i).attr('src', "");
    $thumbnail.eq(i).hide();
});

$checkAgree.on("change", function(){
    let isChecked = $(this).prop("checked");
    isChecked ? checkedSaveId() : notCheckedSaveId();
});

function checkedSaveId(){
    $("#check-agree span.checkbox").css("border-color", "rgb(235 124 120)");
    $("#check-agree span.checkbox").css("background-color", "rgb(235 124 120)");
}

function notCheckedSaveId(){
    $("#check-agree span.checkbox").css("border-color", "");
    $("#check-agree span.checkbox").css("background-color", "");
}