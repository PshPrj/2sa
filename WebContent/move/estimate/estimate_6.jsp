<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���� ��° ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">�ּ� �Է�</div>

<br/><br/><br/>
<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
%>
function getData(form1){
	var cnt=0;
	var i =0;
	var element = new Array();
	
	if(($('#add1_el').is(":checked"))){//ù ��° �ּ��� ���������� ����
		element[i]= ",[elY";
	}else{
		element[i]= ",[elN";
	}

	
	if(($('#add1_parkinglot').is(":checked"))){//���� ���� ����.
		element[i]+= "pkY+";
	}else{
		element[i]+= "pkN+";
	}
	
	$(add1_1).val=form1.add1_1.value;
	var add1_2=form1.add1_2.value;
	
	if(add1_1==""||add1_2==""){
		alert("�ּҸ� ��Ȯ�� �Է��� �ּ���.");
		return abc;
	}
	
	element[i]+= add1_1;
	element[i]+= add1_2+"]";//ù ��° �ּҰ� ����.

	i=i+1;	

	if(($('#add2_el').is(":checked"))){//�� ��° �ּ����� ���������� ����
		element[i]= "[elY";
	}else{
		element[i]= "[elN";
	}
	
	if(($('#add2_parkinglot').is(":checked"))){//�� ��° �ּ����� ���� ���� ����
		element[i]+="pkY+";
	}else{
		element[i]+= "pkN+";
	}

	var add2_1=form1.add2_1.value;
	var add2_2=form1.add2_2.value;
	if(add2_1==""||add2_2==""){
		alert("�ּҸ� ��Ȯ�� �Է��� �ּ���.");
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
<div class="span2" style="background-color:#B2E0F0">���� �ּ�</div><br/>
&nbsp;&nbsp;&nbsp;
���������� <input type="checkbox" id="add1_el" name="add1_el" value="avail">&nbsp;&nbsp;&nbsp;���� ���� <input type="checkbox" id="add1_parkinglot" name="add1_parkinglot" value="avail"><br/>
<span style="display:inline-block;"><input type="text" id="add1_1">&nbsp;&nbsp;
<input type="button" value="�˻�" onclick='execDaumPostcode(1)'>
</span><br/>
<input type="text" id="add1_2">
<div id="map1" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<br/><br/>


<div class="span2" style="margin-left:0px; background-color:#B2E0F0">�̻� �� �ּ�</div><br/>
&nbsp;&nbsp;&nbsp;
���������� <input type="checkbox" id="add2_el" name="add2_el" value="avail">&nbsp;&nbsp;&nbsp;���� ���� <input type="checkbox" id="add2_parkinglot" name="add2_parkinglot" value="avail"><br/>
<span style="display:inline-block;"><input type="text" id="add2_1">&nbsp;&nbsp;
<input type="button" value="�˻�" onclick='execDaumPostcode(2)'>
</span><br/>
<input type="text" id="add2_2">
<div id="map2" style="width:300px;height:300px;margin-top:10px;display:none"></div>
<br/><br/>	
</div>


<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Jsonsubmit(this.form)"/>

</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=2928e31d70d15cd1ffa4bc3387300c92&libraries=services"></script>
<script>

    var mapContainer1 = document.getElementById('map1'), // ������ ǥ���� div
        mapOption1 = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map1 = new daum.maps.Map(mapContainer1, mapOption1);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder1 = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker1 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map1
    });
    
    var mapContainer2 = document.getElementById('map2'), // ������ ǥ���� div
    mapOption2 = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
        level: 5 // ������ Ȯ�� ����
    };

	//������ �̸� ����
	var map2 = new daum.maps.Map(mapContainer2, mapOption2);
	//�ּ�-��ǥ ��ȯ ��ü�� ����
	var geocoder2 = new daum.maps.services.Geocoder();
	
	var marker2 = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map2
    });
    

    function execDaumPostcode(num) {
        new daum.Postcode({
            oncomplete: function(data) {
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = data.address; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // �⺻ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.addressType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    //fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
				var coords=null;
                
                if(num==1){
                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("add1_1").value = fullAddr;
                document.getElementById("add1_2").value = extraAddr;
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                document.form1.addr1.value=fullAddr;
                // �ּҷ� ��ǥ�� �˻�
	                geocoder1.addr2coord(data.address, function(status, result) {
	                    // ���������� �˻��� �Ϸ������
	                    if (status === daum.maps.services.Status.OK) {
	                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
	                        coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                        document.form1.n_lat.value=result.addr[0].lat;
	                        document.form1.n_lng.value=result.addr[0].lng;
	                        // ������ �����ش�.
	                        mapContainer1.style.display = "block";
	                        map1.relayout();
	                        // ���� �߽��� �����Ѵ�.
	                        map1.setCenter(coords);
	                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
	                        marker1.setPosition(coords);
	                    }
	                });
                }else{
                	 // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                      document.getElementById("add2_1").value = fullAddr;
             		  document.getElementById("add2_2").value=extraAddr;
             		 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             		 document.form1.addr2.value=fullAddr;
                    // �ּҷ� ��ǥ�� �˻�
                    geocoder2.addr2coord(data.address, function(status, result) {
                        // ���������� �˻��� �Ϸ������
                        if (status === daum.maps.services.Status.OK) {
                            // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                            coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                            // ������ �����ش�..
                            document.form1.l_lat.value=result.addr[0].lat;
	                        document.form1.l_lng.value=result.addr[0].lng;
                            mapContainer2.style.display = "block";
                            map2.relayout();
                            // ���� �߽��� �����Ѵ�.
                            map2.setCenter(coords);
                            // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                            marker2.setPosition(coords);
                        }
                    });
                }
            }
        }).open();
    }
</script>
