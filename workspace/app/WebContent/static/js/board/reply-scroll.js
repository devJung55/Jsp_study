$("#more-replies").hide();


const $replyWrite = $("#reply-write-wrap");
const $writeButton = $("#reply-write-wrap button");
const $replyUpdate = $(".reply-update-wrap");
const $updateButton = $("span.update");
const $cancelButton = $("button.calcel");
const $writeTextarea = $("form[name='writeForm'] textarea");
const replyTexts = ['취소', ' ', '댓글 달기'];
const $ul = $("#replies-wrap ul");
const $dimmed = $("div.logo-area");

let page = 1;
/*=======================================================================*/
/*모듈*/
/*=======================================================================*/
const replyService = (function(){
	function write(reply, callback){
		$.ajax({
			url: contextPath + "/reply/writeOk.reply",
			data: reply,
			success: function(){
				if(callback) {callback();}
			}
		});
	}
	
	function list(callback) {
		$.ajax({
			url: contextPath + "/reply/listOk.reply",
			data: {boardId: boardId, page: page},
			dataType: "json",
			success: function(replies){
				if(callback){
					callback(replies);
				}
			}
		});
	}
	return {write: write, list: list};
})();

/*=======================================================================*/
/*이벤트, DOM, Ajax*/
/*=======================================================================*/
replyService.list(showList);

$(window).scroll(
	function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			$dimmed.show();
			page++;
			replyService.list(showList);
		}
	}
);

function showList(replyMoreDTO){
	$dimmed.hide();
	
	let replies = replyMoreDTO.replies;
	let text = "";
	if(replies.length == 0 && page == 1){
		text = `
		<li>
			<h4 class="title">
				댓글이 없습니다.
			</h4>
		</li>
		`
	}else {
		replies.forEach(reply => {
			text += `
			<li>
	            <div>
	                <section class="content-container">
	                    <div class="profile">
	                        <div><img src="${contextPath}/static/images/reply_profile.png" width="15px"></div>
	                        <h6 class="writer">${reply.memberName}</h6>
	                    </div>
	                    <h4 class="title">${reply.replyContent}</h4>
	                    <section class="reply-update-wrap">
	                        <textarea id="" cols="30" rows="1" placeholder="내 댓글"></textarea>
	                        <div class="button-wrap">
	                            <button class="update-done">작성완료</button>
	                            <button class="calcel">취소</button>
	                        </div>
	                    </section>
	                    <h6 clss="board-info">
	                        <span class="date">${elapsedTime(reply.replyRegisterDate == reply.replyUpdateDate ? reply.replyRegisterDate : reply.replyUpdateDate)}</span>
	                        <span class="date">·</span>
	                        <span class="update">수정</span>
	                        <span class="date">·</span>
	                        <span class="delete">삭제</span>
	                    </h6>
	                </section>
	            </div>
	        </li>
			`
		});
	}
	$ul.append(text);
}

$("#write-ok").on("click", write);

function write(){
	const $replyContent = $("textarea[name='replyContent']");
	let reply = new Object();
	reply.replyContent = $replyContent.val();
	reply.boardId = boardId;
	
	$replyContent.val("");
	replyService.write(reply, function(){
		showReply();
		$ul.children().remove();
		page = 1;
		$dimmed.show();
		replyService.list(showList);
	});
}
/*=======================================================================*/
/*퍼블리싱*/
/*=======================================================================*/
let flag = 1;

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














