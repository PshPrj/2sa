/**
 * <!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/19
	data 자르기
 -->
 */



function splitData(Data, form1){
	var list1=Data.split(",");//데이터 묶음으로 나누기.
	var elements = form1.getElementsByTagName("div");
	var element=new Array()
	var final_list;
	var j = 0;
	for(var i in list1){
		element=list1[i].split("_");//묶음을 하나씩 요소로 나누기.
		for(var j = 0 ; j<elements.length ; j++){
			for(var n = elements.item(j).firstChild; n!=null;n=n.nextSibling){
				if(n.nodeType==1){//엘리먼트 요소인지 확인
					var id_has = n.hasAttribute("id");
					if(id_has==true){
						var id = n.getAttribute("id");
						
							if(id=="title"&&n.firstChild.nodeValue==element[0]){//해당 엘리먼트 id가 title인지 확인
								
								if(element[1].includes("개")){//id와 개수만 존재하는 경우
									n.nextSibling.nextSibling.nextSibling.nextSibling.value=element[1].split("개")[0];
								}else if(element[0].includes("버리는")){//버리는 것에 관련된 구문
									n.nextSibling.nextSibling.nextSibling.value=element[1];
								}else{
									n.nextSibling.nextSibling.value=element[1];
									if(element[2].includes("cm")){//사이즈 입력하는 경우
										n.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.value=element[2].split("cm")[0];
										n.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.nextSibling.nextSibling.value=element[3].split("cm")[0];
										n.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value=element[4].split("개")[0];
										
									}else{//기타
										n.nextSibling.nextSibling.nextSibling.nextSibling.value=element[2];
										n.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.value=element[3].split("개")[0];
									}
							}
							}
					}
			}
		}
		}

	}	

}
