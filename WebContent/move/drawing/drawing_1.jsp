<!-- 
	담당 :  박승현 
	최종 수정 일자 : 6/18
	도면을 그리는 페이지.


 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="span5" id="ver"
	style="background-color: #E5B1C5; height: 20px; width: 100px; margin-top: 0px; align: left;">배치도
	그리기</div>

<br />

<script>

	function numCheck(line){  //정규표현식 함수
		var numCheck = /[0-9]/;
		if(!(numCheck.test($("#"+line).val()))){
			$("#text").text("숫자만 입력").css({"font-size":30,"color":"red"}); 
			$("#"+line).val("").focus();
		}else{
			$("#text").text("도면 생성").css({"font-size":30,"color":"green"}); 
		}
	}
	
	function Swap(w , h ,c){
		var grop = c*1; //숫자열로 바꾸기위해 *1
		var wsize =w*1;
		var hsize =h*1;
		
		if(grop == 1){
			grop = "";
		}
		var c="";
		if(wsize<hsize){
			c =wsize;
			wsize = hsize;
			hsize =c;

			$("#text").text("가로,세로 스왑").css({"font-size":30,"color":"green"});
		}	
		$("#wsize"+grop+"").val(wsize);
		$("#hsize"+grop+"").val(hsize);
		
		
	}
	
	$(document).ready(function() {
		
		//텍스트 필드 클릭시 값 초기화
		$("input[type='text']").click(function(event){		
			var target = event.target.id;
			$("#"+target).val("");
			});
	
		var rt1 = 1;  // 도면저장을 위한 비율.
		var rt2 = 1;  
		
		/*
			1번 도면
		*/

		$("input[title='grop1']").change(function(event){  //텍스트 창에 값을 입력하면 바로 캔버스에 작용. 
			
			/*
			 	정규 표현식 숫자 이외의 것은 표현 ㄴㄴ
			*/
			var target = event.target.id;

			numCheck(target); //정규표현식.

			var hr1 = null; //가로사이즈에 맞는 세로사이즈. 
	
			
			/*
				세로가 가로보다 클 경우 
				값을 바꿔줌.
			*/

			Swap($("#wsize").val(), $("#hsize").val() ,1);

			
			
			
			rt1 = (500 / $("#wsize").val())/100;    //1번 캔버스 비율
			hr1 =500 * $("#hsize").val()/$("#wsize").val(); //가로사이즈에 맞는 세로사이즈 
			
			$("#mycanvas1").attr("height",hr1); 
			
		
		});	
		
		
		/*
		2번 도면 복층
		*/
		$("input[title='grop2']").change(function(){
			
			var target = event.target.id;

			numCheck(target); //정규표현식.
			
			var hr2 = null;

			 /*
			 	세로가 가로보다 클 경우 값을 바꿔줌.
			 */
			Swap($("#wsize2").val(), $("#hsize2").val() ,2);
			 
			rt2 = (500 / $("#wsize2").val())/100; //2번 캔버스 비율
			hr2 =500 * $("#hsize2").val()/$("#wsize2").val(); //가로사이즈에 맞는 세로사이즈 
			
			$("#mycanvas2").attr("height",hr2); 

			
		});	
	
		

		
		
		
		var choose = 1; //캔버스 페이지
		var ctr = 2; //회전  or 삭제 컨트롤러.
		
		/*
		가구 생성.
		*/
		$("input[value='만들기'] ").click(function(event) { 
			$("#text").text("가구 생성").css({"font-size":30,"color":"green"});
			var name = event.target.id;  		
			var parent = event.target.parentNode;
			var w = parent.w.value;
			var h = parent.h.value;
			var ratio2 = null //비율 변수.
			if (choose == 1) {
				ratio2 = rt1;
			} else {
				ratio2 = rt2;
			}
			
			
			/*
			가구를 켄버스에 비율에 맞게 그려줌.
			or 움직이기 가능 
			or 클릭시 가장 위로 올라옴
			*/
			$('#mycanvas' + choose).drawImage({

				draggable : true, //움직임가능
				bringToFront : true, //움직인것이 위로

				source : '../../img/room/' + name + '.png',
				x : 50,
				y : 50,

				width : w * ratio2,
				height : h * ratio2,
				
				cursors : { //마우스 오버시 손가락 모양

					mouseover : 'pointer',

					mousedown : 'move',

					mouseup : 'pointer'
				},
				

				/*
					도면의 가구 크기조절 핸들러 이지만
					사용시 어색함이있어  미사용
				*/
				/*
				handle: {  //크기조절
				    type: 'rectangle',
				    fillStyle: '#fff',
				    strokeStyle: '#c33',
				    strokeWidth: 2,
				    width: 3, height: 3,
				    cornerRadius: 1
				  },
				  resizeFromCenter: true,
				 */
				
				 /*
				 	더블클릭 이벤트
				 	 1. 회전
				 	 2. 삭제
				 	 버튼 누를때마다 바뀜.
				 */
				dblclick : function(layer) { 
					/* 회전 */
					if (ctr == 1) {
						$("#text").text("가구 회전").css({"font-size":30,"color":"green"});
						$(this).animateLayer(layer, {

							rotate : '+=45',
						});
						/* 삭제 */
					} else if (ctr == 2) {
						$("#text").text("가구 삭제").css({"font-size":30,"color":"green"});
						$(this).animateLayer(layer, {
							//사이즈를 0으로 만들어서 삭제하는것처럼 보이게.
							width : 0,
							height : 0,
						});
					}

				},

			})

		});

		/*
			체크박스 클릭시 복층 사용 가능.
		*/ 
		$("input:checkbox").on("click", function() {
			
			var check = $(this).is(":checked");
			if (check == true) {

				$("#text").text("복층 생성").css({"font-size":30,"color":"green"}); 
				$("#canvaspaging").show();
			} else {
				$("#text").text("복층 삭제").css({"font-size":30,"color":"green"}); 
				$("#canvaspaging").hide();
			}

		});
		
		/* 
			캔버스 저장.
			ajax적용
		*/
		$("input[value='저장']").click(function(event) {
			
			if($("#wsize").val() == "" || $("#hsize").val() == ""){
				$("#text").text("도면의 크기를 입력해주세요").css({"font-size":20,"color":"red"});
				return;
			}else if($("#wsize2").val() != "" && $("#hsize2").val() == "" || $("#hsize2").val() != "" && $("#wsize2").val() == "" ){
				$("#text").text("값을 마저 입력해주세요.").css({"font-size":20,"color":"red"});
				return;
			}
			
			
			var canvas2 ="";
			var canvas1 = $('#mycanvas1').getCanvasImage('png');
			if($("#checkbox").is(":checked") == true){
				canvas2 = $('#mycanvas2').getCanvasImage('png');
			}
		
				
			/*
			ajax를 이용해
			페이지 이동하는 기술
			*/
			  $.ajax({
			      type: "POST", 
			      url: "../drawing.do?cmd=D_1", 
			      contentType: "application/x-www-form-urlencoded; charset=utf-8",  
			      data: { "imgBase64": canvas1, "imgBase64_2":canvas2 }
			    }).success(function(o) {
			    	$("#text").text("도면 저장 완료").css({"font-size":30,"color":"green"});
			    });

		});
		
		
		/*
			도면 페이징 역활
		*/
		$("span[title='page']").click(function(event){
			if(event.target.id == "page1"){
				$("#text").text("1번도면").css({"font-size":30,"color":"green"});
				$("#canvas1").show();
				$("#canvas2").hide();
				choose =1;
			}else{
				$("#text").text("2번도면").css({"font-size":30,"color":"green"});
				$("#canvas1").hide();
				$("#canvas2").show();
				choose =2;
			}
		});
		
		/*
			도면안의 가구 삭제 or 회전 컨트롤버튼
		*/
		$("#ctr").click(function(event) {
			if (ctr == 1) {
				$("#text").text("더블클릭시  가구삭제").css({"font-size":20,"color":"green"});
				ctr = 2;
				$("#ctr").text("회전");
			} else {
				$("#text").text("더블클릭시  가구회전").css({"font-size":20,"color":"green"});
				ctr = 1;
				$("#ctr").text("삭제");
			}

		});

		var tbl = 1;


		/*
			우측의 가구목록 페이징 역활.
		*/
		$("button[title='tblpage'").click(function(event) {
			if(event.target.id == "prev"){
				$("#text").text("가구 목록 뒤로").css({"font-size":20,"color":"green"});
				$("#tbl" + tbl).hide();
				tbl = tbl - 1;
				if (tbl == 0) {
					tbl = 3;
				}
				$("#tbl" + tbl).show();
			}else{

				$("#text").text("가구 목록 앞으로").css({"font-size":20,"color":"green"});
				$("#tbl" + tbl).hide();
				tbl = tbl + 1;
				if (tbl == 4) {
					tbl = 1;
				}

				$("#tbl" + tbl).show();
			}
		})		

	});
</script>
<style>
[class*="left"] {
	text-align: left;
}

[class*="dropdown-menu"] {
	margin-right: 10px
}
</style>
<form name="form2"></form>

<!--
	그림판
-->
<center>견적은 딱 한 건만 저장 됩니다(새로 견적 저장 시 이전의 것은 지워집니다.).</center>
<div class="row-fluid">
	<div class="span8" style="padding-left: 30px;">
		<div id="canvas1">

			<label class="offset1 span2"
				style="padding-top: 5px; padding-left: 30px"><input
				type="checkbox" id="checkbox">복층 </label> <input type="text"
				class="span3" id="wsize" name="wsize" placeholder="가로  (단위 :M)"
				title="grop1" /> <input type="text" class="span3" id="hsize"
				name="hsize" placeholder="세로  (단위 :M)" title="grop1" /> <input
				type="button" class="btn" value="저장" id="save" />
			<canvas width="500" height="500" id="mycanvas1"></canvas>
		</div>
		<div hidden="true" id="canvas2">
			<h4>
				복층 : <input type="text" class="span3" id="wsize2"
					placeholder="가로  (단위 :M)" title="grop2" /> <input type="text"
					class="span3" id="hsize2" placeholder="세로  (단위 :M)" title="grop2" />
				<input type="button" class="btn" value="저장" id="save" />
			</h4>
			<canvas width="500" height="500" id="mycanvas2"></canvas>
		</div>

	</div>



<!--
	우측의 선택 창
-->


	<div class="span4" style="margin-top: 80px">
		<div align="center">
			<label id="text"></label>
		</div>

		<div class="row" align="center">

		<!-- 
			하단의 테이블
			비효율적이라 수정할 예정
		-->


			<table id="tbl1">
				<tr>
					<td>
						<div class="dropdown">
							<img id="room" src="../../img/room/room.png" alt="The Scream"
								data-toggle="dropdown" title="방" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="room" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="block" src="../../img/room/block.png" alt="The Scream"
								data-toggle="dropdown" title="벽" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="block" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="bed" src="../../img/room/bed.png" alt="The Scream"
								data-toggle="dropdown" title="침대" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="bed" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="box" src="../../img/room/box.png" alt="The Scream"
								data-toggle="dropdown" title="상자" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="box" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown ">
							<img id="chair" src="../../img/room/chair.png" alt="The Scream"
								data-toggle="dropdown" title="의자" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="chair" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="chest-of-drawers"
								src="../../img/room/chest-of-drawers.png" alt="The Scream"
								data-toggle="dropdown" title="서랍장" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="chest-of-drawers" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown dropup">
							<img id="desk" src="../../img/room/desk.png" alt="The Scream"
								data-toggle="dropdown" title="책상" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="desk" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="dishwasher" src="../../img/room/dishwasher.png"
								alt="The Scream" data-toggle="dropdown" title="식기세척기" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="dishwasher" />
								</form>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<table hidden="hidden" id="tbl2">
				<tr>
					<td>
						<div class="dropdown">
							<img id="microwave" src="../../img/room/microwave.png"
								alt="The Scream" data-toggle="dropdown" title="전자레인지" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="microwave" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="door" src="../../img/room/door.png" alt="The Scream"
								data-toggle="dropdown" title="현관" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="door" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="sofa" src="../../img/room/sofa.png" alt="The Scream"
								data-toggle="dropdown" title="쇼파" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="sofa" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="monitor" src="../../img/room/monitor.png"
								alt="The Scream" data-toggle="monitor" title="컴퓨터" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="monitor" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="television" src="../../img/room/television.png"
								alt="The Scream" data-toggle="dropdown" title="TV" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="television" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="stool" src="../../img/room/stool.png" alt="The Scream"
								data-toggle="dropdown" title="작은 의자" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="stool" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="wardrobe" src="../../img/room/wardrobe.png"
								alt="The Scream" data-toggle="dropdown" title="장롱" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="wardrobe" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="washing-machine"
								src="../../img/room/washing-machine.png" alt="The Scream"
								data-toggle="dropdown" title="세탁기" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="washing-machine" />
								</form>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<table hidden="hidden" id="tbl3">

				<tr>
					<td>
						<div class="dropdown">
							<img id="bathroom" src="../../img/room/bathroom.png"
								alt="The Scream" data-toggle="dropdown" title="화장실" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="bathroom" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="pot" src="../../img/room/pot.png" alt="The Scream"
								data-toggle="dropdown" title="화분" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="pot" />
								</form>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="dropdown">
							<img id="instrument" src="../../img/room/instrument.png"
								alt="The Scream" data-toggle="dropdown" title="악기" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="instrument" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="ricecooker" src="../../img/room/ricecooker.png"
								alt="The Scream" data-toggle="dropdown" title="밥솥" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="ricecooker" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="cycle" src="../../img/room/cycle.png" alt="The Scream"
								data-toggle="dropdown" title="자전거" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="cycle" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="fan" src="../../img/room/fan.png" alt="The Scream"
								data-toggle="dropdown" title="선풍기" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="fan" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="table" src="../../img/room/table.png" alt="The Scream"
								data-toggle="dropdown" title="식탁" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="table" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="vanity" src="../../img/room/vanity.png" alt="The Scream"
								data-toggle="dropdown" title="화장대" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="가로 (단위 :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="세로 (단위 :CM)" name="h" class="span10" /> <input
										type="button" value="만들기" id="vanity" />
								</form>
							</div>
						</div>
					</td>
				</tr>
			</table>


		</div>



	</div>
</div>






<!-- 
	하단의 컨트롤러같은 역활.
-->

<div class="row">
	<div class="span8">
		<div class="span7" style="text-align: right;">
			<span id="canvaspaging" hidden="hidden"> <span id="page1"
				class="btn" title="page">1</span>&nbsp;&nbsp;<span id="page2"
				class="btn" title="page">2</span>
			</span>

		</div>
		<div class="span5" style="text-align: right;">
			가구 수정:
			<button id="ctr" class="btn">회전</button>
		</div>

	</div>
	<div class="span4">
		<div>
			<button class="btn" id="prev" title="tblpage">◁</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn" id="next" title="tblpage">▷</button>

		</div>
	</div>

</div>

