<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/19
	여섯 번째 페이지
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">주소 입력</div>

<br/><br/><br/>
<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
%>
function getData(form1){
	var cnt=0;
	var i =0;
	var element = new Array();
	
	if(($('#add1_el').is(":checked"))){//첫 번째 주소의 엘리베이터 유무
		element[i]= ",[elY";
	}else{
		element[i]= ",[elN";
	}

	
	if(($('#add1_parkinglot').is(":checked"))){//주차 가능 여부.
		element[i]+= "pkY+";
	}else{
		element[i]+= "pkN+";
	}
	
	$(add1_1).val=form1.add1_1.value;
	var add1_2=form1.add1_2.value;
	
	if(add1_1==""||add1_2==""){
		alert("주소를 정확히 입력해 주세요.");
		return abc;
	}
	
	element[i]+= add1_1;
	element[i]+= add1_2+"]";//첫 번째 주소값 저장.

	i=i+1;	

	if(($('#add2_el').is(":checked"))){//두 번째 주소지의 엘리베이터 여부
		element[i]= "[elY";
	}else{
		element[i]= "[elN";
	}
	
	if(($('#add2_parkinglot').is(":checked"))){//두 번째 주소지의 주차 가능 여부
		element[i]+="pkY+";
	}else{
		element[i]+= "pkN+";
	}

	var add2_1=form1.add2_1.value;
	var add2_2=form1.add2_2.value;
	if(add2_1==""||add2_2==""){
		alert("주소를 정확히 입력해 주세요.");
		return abc;
	}
	
	element[i]+= form1.add2_1.value;
	element[i]+= form1.add2_2.value+"],";

	return element;
}

function Jsonsubmit(form1){
		var Data = getData(form1, 0, 0);
		var DataArray = new Array();
		
		var beforeData='${Data}';
		
		var DataArray=new String();
		DataArray+=beforeData;
		DataArray+=Data;
		
		document.form1.DataArray.value=DataArray;
		document.form1.submit();
	}
	

</script>

<form method="POST" action="../estimate.do" name="form1">
	<input type="hidden" value="E_7" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="n_lat"/>
	<input type="hidden" value="" name="n_lng"/>
	<input type="hidden" value="" name="l_lat"/>
	<input type="hidden" value="" name="l_lng"/>
	<input type="hidden" value="" name="addr1"/>
	<input type="hidden" value="" name="addr2"/>
	
<div align=left>
<div class="span2" style="background-color:#B2E0F0">현재 주소</div><br/>
&nbsp;&nbsp;&nbsp;
엘리베이터 <input type="checkbox" id="add1_el" name="add1_el" value="avail">&nbsp;&nbsp;&nbsp;주차 공간 <input type="checkbox" id="add1_parkinglot" name="add1_parkinglot" value="avail"><br/>
<span style="display:inline-block;"><input type="text" id="add1_1">&nbsp;&nbsp;
<input type="button" value="검색" onclick='execDaumPostcode(1)'>
</span><br/>
<input type="text" id="add1_2">
<div id="map1" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<br/><br/>


<div class="span2" style="margin-left:0px; background-color:#B2E0F0">이사 갈 주소</div><br/>
&nbsp;&nbsp;&nbsp;
엘리베이터 <input type="checkbox" id="add2_el" name="add2_el" value="avail">&nbsp;&nbsp;&nbsp;주차 공간 <input type="checkbox" id="add2_parkinglot" name="add2_parkinglot" value="avail"><br/>
<span style="display:inline-block;"><input type="text" id="add2_1">&nbsp;&nbsp;
<input type="button" value="검색" onclick='execDaumPostcode(2)'>
</span><br/>
<input type="text" id="add2_2">
<div id="map2" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<br/><br/>	
</div>


<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Jsonsubmit(this.form)"/>

</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=2928e31d70d15cd1ffa4bc3387300c92&libraries=services"></script>
<script>

    var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div
        mapOption1 = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map1 = new daum.maps.Map(mapContainer1, mapOption1);
    //주소-좌표 변환 객체를 생성
    var geocoder1 = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker1 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map1
    });
    
    var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div
    mapOption2 = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

	//지도를 미리 생성
	var map2 = new daum.maps.Map(mapContainer2, mapOption2);
	//주소-좌표 변환 객체를 생성
	var geocoder2 = new daum.maps.services.Geocoder();
	
	var marker2 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map2
    });
    

    function execDaumPostcode(num) {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    //fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
				var coords=null;
                
                if(num==1){
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("add1_1").value = fullAddr;
                document.getElementById("add1_2").value = extraAddr;
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                document.form1.addr1.value=fullAddr;
                // 주소로 좌표를 검색
	                geocoder1.addr2coord(data.address, function(status, result) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        // 해당 주소에 대한 좌표를 받아서
	                        coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                        document.form1.n_lat.value=result.addr[0].lat;
	                        document.form1.n_lng.value=result.addr[0].lng;
	                        // 지도를 보여준다.
	                        mapContainer1.style.display = "block";
	                        map1.relayout();
	                        // 지도 중심을 변경한다.
	                        map1.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker1.setPosition(coords);
	                    }
	                });
                }else{
                	 // 주소 정보를 해당 필드에 넣는다.
                      document.getElementById("add2_1").value = fullAddr;
             		  document.getElementById("add2_2").value=extraAddr;
             		 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             		 document.form1.addr2.value=fullAddr;
                    // 주소로 좌표를 검색
                    geocoder2.addr2coord(data.address, function(status, result) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
                            // 해당 주소에 대한 좌표를 받아서
                            coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                            // 지도를 보여준다..
                            document.form1.l_lat.value=result.addr[0].lat;
	                        document.form1.l_lng.value=result.addr[0].lng;
                            mapContainer2.style.display = "block";
                            map2.relayout();
                            // 지도 중심을 변경한다.
                            map2.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker2.setPosition(coords);
                        }
                    });
                }
            }
        }).open();
    }
</script>
