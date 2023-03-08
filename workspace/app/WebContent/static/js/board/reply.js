const $replyWrite = $("#reply-write-wrap");
const $writeButton = $("#reply-write-wrap button");
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
	
	function update(reply, callback){
		$.ajax({
			url: contextPath + "/reply/updateOk.reply",
			data: reply,
			dataType: "json",
			success: function(reply){
				if(callback){
					callback(reply);
				}
			}
		});
	}
	
	function remove(replyId, callback) {
		$.ajax({
			url: contextPath + "/reply/deleteOk.reply",
			data: {replyId: replyId},
			success: function(){
				if(callback) {
					callback();
				}
			}
		});
	}
	
	return {write: write, list: list, update: update, remove: remove};
})();

/*=======================================================================*/
/*이벤트, DOM, Ajax*/
/*=======================================================================*/
$("#more-replies").hide();
replyService.list(showList);

$ul.on("click", "span.delete", function(){
	let replyId = $(this).data("reply-id");
	let $dimmedForReply = $("ul").find(".logo-area-reply");
	let i = $ul.find("span.delete").index($(this));
	$dimmedForReply.eq(i).show();
	replyService.remove(replyId, function(){
		$ul.children().remove();
		page = 1;
		$("#more-replies").hide();
		$dimmedForReply.eq(i).hide();
		$dimmed.show();
		replyService.list(showList);
	});
});


$ul.on("click", ".update-done", function(){
	let reply = new Object();
	let i = $ul.find(".update-done").index($(this));
	let $textarea = $ul.find("textarea").eq(i); 
	reply.replyId = $textarea.attr("id");
	reply.replyContent = $textarea.val();
	$dimmed.show();
	replyService.update(reply, function(reply){
		hideUpdate(i);
		$ul.find("h4.title").eq(i).text(reply.replyContent);
		$ul.find("span.time").eq(i).text(elapsedTime(reply.replyUpdateDate));
		$dimmed.hide();
	});
});

$("#more-replies").on("click", function(){
	$("#more-replies").hide();
	$dimmed.show();
	page++;
	replyService.list(showList);
});

function showList(replyMoreDTO){
	$("#more-replies").show();
	$dimmed.hide();
	
	let replies = replyMoreDTO.replies;
	let text = "";

	if(!replyMoreDTO.isNextPage){
		$("#more-replies").hide();
		
	}else{
		$("#more-replies").show()
	}
	
	if(replies.length == 0){
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
	                        <textarea id="${reply.replyId}" cols="30" rows="1" placeholder="내 댓글"></textarea>
	                        <div class="button-wrap">
	                            <button class="update-done">작성완료</button>
	                            <button class="calcel">취소</button>
	                        </div>
	                    </section>
						<div class='dimmed-wrap'>
		                    <h6 clss="board-info">
		                        <span class="date time">${elapsedTime(reply.replyRegisterDate == reply.replyUpdateDate ? reply.replyRegisterDate : reply.replyUpdateDate)}</span>
			`
			if(reply.memberId == memberId){
				text += `
			                        <span class="date">·</span>
			                        <span class="update">수정</span>
			                        <span class="date">·</span>
			                        <span class="delete" data-reply-id="${reply.replyId}">삭제</span>
						`
			}
			
			text +=`
		                    </h6>
							<div class="logo-area logo-area-reply" style="display:none">
								<img src="${contextPath}/static/images/dimmed-reply.png" class="infinite_rotating_logo" width="48">
							</div>
						</div>
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
		$("#more-replies").hide();
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

$ul.on("click", "span.update", function(){
	/*수정 버튼이 여러 개이기 때문에, 클릭한 수정버튼에만 이벤트가 발생해야 한다.*/
	/*누른 수정 버튼의 인덱스 번호를 i에 담아준다.*/
	let i = $ul.find("span.update").index($(this));
	showUpdate(i);
});

$ul.on("click", "button.calcel", function(){
	let i = $ul.find("button.calcel").index($(this));
	hideUpdate(i);
});

function showUpdate(i){
	let $replyUpdate = $ul.find(".reply-update-wrap").eq(i);
    let content = $replyUpdate.prev().text().trim();
    let $textarea = $replyUpdate.find("textarea");
    $textarea.val(content);
    $replyUpdate.prev().hide();
    $replyUpdate.next().hide();
    $replyUpdate.show();
}

function hideUpdate(i){
	let $replyUpdate = $ul.find(".reply-update-wrap").eq(i);
    $replyUpdate.hide();
    $replyUpdate.prev().show();
    $replyUpdate.next().show();
}

$writeTextarea.on("focus", function(){
    $(this).closest("span").css('border', '1px solid rgb(235 124 120)');
});

$writeTextarea.on("blur", function(){
    $(this).closest("span").css('border', '1px solid rgba(0, 0, 0, 0.1)');
});














