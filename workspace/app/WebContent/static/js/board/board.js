autosize($("textarea"));

const $search = $("div.search-container input");
const $upload = $("input.upload");
const $thumbnail = $("label.attach img.thumbnail");
const $checkAgree = $("input[name='agree']");

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

/*정렬 이벤트 및 스타일 변경*/
const $orders = $("section.order a");
$orders.on("click", function(e){
	let i = $orders.index($(this));
	location.href=`${contextPath}/board/listOk.board?sort=${i == 0 ? 'recent' : 'popular'}&type=${type}&keyword=${keyword}`;
});

function elapsedTime(date) {
  const start = new Date(date);
  const end = new Date();

  const diff = (end - start) / 1000;
  
  const times = [
    { name: '년', milliSeconds: 60 * 60 * 24 * 365 },
    { name: '개월', milliSeconds: 60 * 60 * 24 * 30 },
    { name: '일', milliSeconds: 60 * 60 * 24 },
    { name: '시간', milliSeconds: 60 * 60 },
    { name: '분', milliSeconds: 60 },
  ];

  for (const value of times) {
    const betweenTime = Math.floor(diff / value.milliSeconds);

    if (betweenTime > 0) {
      return `${betweenTime}${value.name} 전`;
    }
  }
  return '방금 전';
}