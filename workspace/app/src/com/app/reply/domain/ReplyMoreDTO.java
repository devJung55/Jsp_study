package com.app.reply.domain;

import java.util.List;

public class ReplyMoreDTO {
	private List<ReplyDTO> replyDTOs;
	private boolean isNextPage;
	
	public ReplyMoreDTO() {;}

	public List<ReplyDTO> getReplyDTOs() {
		return replyDTOs;
	}

	public void setReplyDTOs(List<ReplyDTO> replyDTOs) {
		this.replyDTOs = replyDTOs;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}

	@Override
	public String toString() {
		return "ReplyMoreDTO [replyDTOs=" + replyDTOs + ", isNextPage=" + isNextPage + "]";
	}
}
