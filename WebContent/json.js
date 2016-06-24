/**
 * <!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/19
	 data 모으기.
 -->
 *
 */

function getData(form1, stan, size){
	
	var elements = form1.getElementsByTagName("div");
	var element = new Array();
	
	var obj=new Array();
	var j=0;
	var num=0;
	
	for(var i =0 ; i<elements.length ; i++){
		var cnt=0;
		for(var n = elements.item(i).firstChild; n!=null;n=n.nextSibling){
			if(n.nodeType == 1){//엘리먼트 노드인지 확인
				var id_has = n.hasAttribute("id");
				if(id_has==true){
					var id = n.getAttribute("id");
						if(id=="kind"&&n.value!="종류"){//값이 입력된 경우에만 cnt값이 중가한다.
							obj[j]+=n.value+"_";
							cnt=cnt+1;		
						}else if(id=="frame"&&n.value!="종류"){
							obj[j]+=n.value+"_";
							cnt=cnt+2;
						}else if(id=="num"&&n.value!="0"){
							obj[j]+=n.value+"개_";
							cnt=cnt+1;
							num=num+Number(n.value);
						}else if(id=="size"){
							var width=n.firstChild.nextSibling.value;
							if(width!="0"){
								obj[j]+=width+"cm_";
								cnt=cnt+1;
							}
							
							var height=n.firstChild.nextSibling.nextSibling.nextSibling.value;
							if(height!="0"){
								obj[j]+=height+"cm_";
								cnt=cnt+1;
							}
						}else if(id=="title"){
							obj[j]=n.firstChild.nodeValue+"_";
						}else if(id=="trash"&&n.value!=""){
							obj[j]+=n.value;
							cnt=cnt+4;
						}else if(id=="num2"&&n.value!="0"){
							obj[j]+=n.value+"개_";
							cnt=cnt+4;
							num=num+Number(n.value);
						}else if(id=="num3"&&n.value!="0"){
							obj[j]+=n.value+"개_";
							cnt=cnt+4;
							sessionStorage.price=Number(sessionStorage.price)+Number(n.value)*3000;
						}
						
				}
			
			}

		}	
		if(cnt==4){//값이 모두 입력된 경우.
			j=j+1;
		}else if(cnt>=1&&cnt<=3){//값이 모두 입력되지 않은 경우.
			alert("항목을 다시 한 번 확인해 주세요!");
			return abcd;
		}else if(cnt==0){//값을 아예 입력하지 않은 경우.
			obj[j]=null;
		}
	}
	
	var price=(num-stan)*2500*size;//가격 기준.
	
	if(price>0){
		sessionStorage.price=Number(sessionStorage.price)+Number(price);//가격 계산.
	}

	return obj;
}



