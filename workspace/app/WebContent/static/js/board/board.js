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

/*게시글 목록*/
showList();

function showList(){
	boards = JSON.parse(boards);
	const $ul = $("#content-wrap ul");
	let text = "";
	boards.forEach(board => {
		console.log(board);
		text += `
			<li>
		        <div>
		            <a href="javascript:void(0)">
		                <section class="content-container">
		                    <div class="profile">
		                        <div><img src="${contextPath}/static/images/profile.png" width="15px"></div>
		                        <h6 class="writer">${board.memberName}</h6>
		                    </div>
		                    <h4 class="title">${board.boardTitle}</h4>
		                    <h6 clss="board-info">
		                        <span class="read-count">조회 ${board.boardReadCount}</span>
		                        <span>·</span>
		                        <span class="date">`+ elapsedTime(board.boardRegisterDate) +`</span>
		                    </h6>
		                </section>
			`;
			/*첨부파일 있을 경우 img 태그 추가*/
						/*<img src="" class="preview">*/
			text += `
		            </a>
		        </div>
		    </li>
			`;
	});
	$ul.append(text);
}

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




















