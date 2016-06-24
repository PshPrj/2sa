/**
 * <!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/19
	댓글 수정 페이지
 -->
 */

var count=0;

function updateComment(c_update, comment_num, comment_content, board_num){
		var update=c_update;
		var comment_update = document.createElement("textarea");//댓글 수정을 위한 textarea 생성
		comment_update.setAttribute("name", "comment_content");
		comment_update.setAttribute("id", "comment"+(++count));
		comment_update.setAttribute("rows","3");
		comment_update.setAttribute("style","WIDTH:80%");
		comment_update.value=comment_content;

		var update_c=document.createElement("input");//update 버튼
		update_c.setAttribute("class","btn btn-sm");
		update_c.setAttribute("value", "수정");
		update_c.setAttribute("id", "updateComment"+count);
		update_c.setAttribute("onclick", "submit()");
		update_c.setAttribute("style","width:5%");
		
		var delete_f = document.createElement("input");//취소 버튼
		delete_f.setAttribute("class","btn btn-sm");
		delete_f.setAttribute("value", "취소");
		delete_f.setAttribute("id","deleteText"+count);
		delete_f.setAttribute("onclick","cmd=CCANCEL");
		delete_f.setAttribute("style","width:5%");
		
		var div_s=document.createElement("div");
		div_s.setAttribute("class","span8");
		
		var form = document.createElement("form");//전송 form
		form.setAttribute("action","../comment.do");
		form.setAttribute("method","POST");
		
		
		var comment_value=document.createElement("input");//댓글 내용 함께 보내기.
		comment_value.setAttribute("type","hidden");
		comment_value.setAttribute("name","comment_content");
		comment_value.setAttribute("value","");
		
		var cmd=document.createElement("input");//댓글 수정을 위한 변수
		cmd.setAttribute("type","hidden");
		cmd.setAttribute("name","cmd");
		cmd.setAttribute("value","CUPDATE");
		
		var c_num=document.createElement("input");//댓글 번호
		c_num.setAttribute("type","hidden");
		c_num.setAttribute("name","comment_num");
		c_num.setAttribute("value",comment_num);
		
		var b_num=document.createElement("input");//게시판 번호
		b_num.setAttribute("type","hidden");
		b_num.setAttribute("name","board_num");
		b_num.setAttribute("value",board_num);

		
		var parent = update.parentNode;
		
		div_s.appendChild(comment_update);
		div_s.appendChild(update_c);
		div_s.appendChild(delete_f);
		
		
		form.appendChild(div_s);
		form.appendChild(comment_value);
		form.appendChild(cmd);
		form.appendChild(c_num);
		form.appendChild(b_num);

		//댓글 수정 창이 댓글이 있던 곳에 위치하도록 insertBefore 활용
		parent.parentNode.insertBefore(form, parent.previousSibling.previousSibling.previousSibling.previousSibling.nextSibling);
		parent.parentNode.removeChild(parent.previousSibling.previousSibling);//리플 수정/삭제 버튼 지우기
		parent.parentNode.removeChild(parent);//리플 내용 지우기
		
		$('#comment_update').val(comment_content);
	
	}