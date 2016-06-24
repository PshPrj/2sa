<!-- 
	��� :  �ڽ��� 
	���� ���� ���� : 6/18
	������ �׸��� ������.


 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="span5" id="ver"
	style="background-color: #E5B1C5; height: 20px; width: 100px; margin-top: 0px; align: left;">��ġ��
	�׸���</div>

<br />

<script>

	function numCheck(line){  //����ǥ���� �Լ�
		var numCheck = /[0-9]/;
		if(!(numCheck.test($("#"+line).val()))){
			$("#text").text("���ڸ� �Է�").css({"font-size":30,"color":"red"}); 
			$("#"+line).val("").focus();
		}else{
			$("#text").text("���� ����").css({"font-size":30,"color":"green"}); 
		}
	}
	
	function Swap(w , h ,c){
		var grop = c*1; //���ڿ��� �ٲٱ����� *1
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

			$("#text").text("����,���� ����").css({"font-size":30,"color":"green"});
		}	
		$("#wsize"+grop+"").val(wsize);
		$("#hsize"+grop+"").val(hsize);
		
		
	}
	
	$(document).ready(function() {
		
		//�ؽ�Ʈ �ʵ� Ŭ���� �� �ʱ�ȭ
		$("input[type='text']").click(function(event){		
			var target = event.target.id;
			$("#"+target).val("");
			});
	
		var rt1 = 1;  // ���������� ���� ����.
		var rt2 = 1;  
		
		/*
			1�� ����
		*/

		$("input[title='grop1']").change(function(event){  //�ؽ�Ʈ â�� ���� �Է��ϸ� �ٷ� ĵ������ �ۿ�. 
			
			/*
			 	���� ǥ���� ���� �̿��� ���� ǥ�� ����
			*/
			var target = event.target.id;

			numCheck(target); //����ǥ����.

			var hr1 = null; //���λ���� �´� ���λ�����. 
	
			
			/*
				���ΰ� ���κ��� Ŭ ��� 
				���� �ٲ���.
			*/

			Swap($("#wsize").val(), $("#hsize").val() ,1);

			
			
			
			rt1 = (500 / $("#wsize").val())/100;    //1�� ĵ���� ����
			hr1 =500 * $("#hsize").val()/$("#wsize").val(); //���λ���� �´� ���λ����� 
			
			$("#mycanvas1").attr("height",hr1); 
			
		
		});	
		
		
		/*
		2�� ���� ����
		*/
		$("input[title='grop2']").change(function(){
			
			var target = event.target.id;

			numCheck(target); //����ǥ����.
			
			var hr2 = null;

			 /*
			 	���ΰ� ���κ��� Ŭ ��� ���� �ٲ���.
			 */
			Swap($("#wsize2").val(), $("#hsize2").val() ,2);
			 
			rt2 = (500 / $("#wsize2").val())/100; //2�� ĵ���� ����
			hr2 =500 * $("#hsize2").val()/$("#wsize2").val(); //���λ���� �´� ���λ����� 
			
			$("#mycanvas2").attr("height",hr2); 

			
		});	
	
		

		
		
		
		var choose = 1; //ĵ���� ������
		var ctr = 2; //ȸ��  or ���� ��Ʈ�ѷ�.
		
		/*
		���� ����.
		*/
		$("input[value='�����'] ").click(function(event) { 
			$("#text").text("���� ����").css({"font-size":30,"color":"green"});
			var name = event.target.id;  		
			var parent = event.target.parentNode;
			var w = parent.w.value;
			var h = parent.h.value;
			var ratio2 = null //���� ����.
			if (choose == 1) {
				ratio2 = rt1;
			} else {
				ratio2 = rt2;
			}
			
			
			/*
			������ �˹����� ������ �°� �׷���.
			or �����̱� ���� 
			or Ŭ���� ���� ���� �ö��
			*/
			$('#mycanvas' + choose).drawImage({

				draggable : true, //�����Ӱ���
				bringToFront : true, //�����ΰ��� ����

				source : '../../img/room/' + name + '.png',
				x : 50,
				y : 50,

				width : w * ratio2,
				height : h * ratio2,
				
				cursors : { //���콺 ������ �հ��� ���

					mouseover : 'pointer',

					mousedown : 'move',

					mouseup : 'pointer'
				},
				

				/*
					������ ���� ũ������ �ڵ鷯 ������
					���� ��������־�  �̻��
				*/
				/*
				handle: {  //ũ������
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
				 	����Ŭ�� �̺�Ʈ
				 	 1. ȸ��
				 	 2. ����
				 	 ��ư ���������� �ٲ�.
				 */
				dblclick : function(layer) { 
					/* ȸ�� */
					if (ctr == 1) {
						$("#text").text("���� ȸ��").css({"font-size":30,"color":"green"});
						$(this).animateLayer(layer, {

							rotate : '+=45',
						});
						/* ���� */
					} else if (ctr == 2) {
						$("#text").text("���� ����").css({"font-size":30,"color":"green"});
						$(this).animateLayer(layer, {
							//����� 0���� ���� �����ϴ°�ó�� ���̰�.
							width : 0,
							height : 0,
						});
					}

				},

			})

		});

		/*
			üũ�ڽ� Ŭ���� ���� ��� ����.
		*/ 
		$("input:checkbox").on("click", function() {
			
			var check = $(this).is(":checked");
			if (check == true) {

				$("#text").text("���� ����").css({"font-size":30,"color":"green"}); 
				$("#canvaspaging").show();
			} else {
				$("#text").text("���� ����").css({"font-size":30,"color":"green"}); 
				$("#canvaspaging").hide();
			}

		});
		
		/* 
			ĵ���� ����.
			ajax����
		*/
		$("input[value='����']").click(function(event) {
			
			if($("#wsize").val() == "" || $("#hsize").val() == ""){
				$("#text").text("������ ũ�⸦ �Է����ּ���").css({"font-size":20,"color":"red"});
				return;
			}else if($("#wsize2").val() != "" && $("#hsize2").val() == "" || $("#hsize2").val() != "" && $("#wsize2").val() == "" ){
				$("#text").text("���� ���� �Է����ּ���.").css({"font-size":20,"color":"red"});
				return;
			}
			
			
			var canvas2 ="";
			var canvas1 = $('#mycanvas1').getCanvasImage('png');
			if($("#checkbox").is(":checked") == true){
				canvas2 = $('#mycanvas2').getCanvasImage('png');
			}
		
				
			/*
			ajax�� �̿���
			������ �̵��ϴ� ���
			*/
			  $.ajax({
			      type: "POST", 
			      url: "../drawing.do?cmd=D_1", 
			      contentType: "application/x-www-form-urlencoded; charset=utf-8",  
			      data: { "imgBase64": canvas1, "imgBase64_2":canvas2 }
			    }).success(function(o) {
			    	$("#text").text("���� ���� �Ϸ�").css({"font-size":30,"color":"green"});
			    });

		});
		
		
		/*
			���� ����¡ ��Ȱ
		*/
		$("span[title='page']").click(function(event){
			if(event.target.id == "page1"){
				$("#text").text("1������").css({"font-size":30,"color":"green"});
				$("#canvas1").show();
				$("#canvas2").hide();
				choose =1;
			}else{
				$("#text").text("2������").css({"font-size":30,"color":"green"});
				$("#canvas1").hide();
				$("#canvas2").show();
				choose =2;
			}
		});
		
		/*
			������� ���� ���� or ȸ�� ��Ʈ�ѹ�ư
		*/
		$("#ctr").click(function(event) {
			if (ctr == 1) {
				$("#text").text("����Ŭ����  ��������").css({"font-size":20,"color":"green"});
				ctr = 2;
				$("#ctr").text("ȸ��");
			} else {
				$("#text").text("����Ŭ����  ����ȸ��").css({"font-size":20,"color":"green"});
				ctr = 1;
				$("#ctr").text("����");
			}

		});

		var tbl = 1;


		/*
			������ ������� ����¡ ��Ȱ.
		*/
		$("button[title='tblpage'").click(function(event) {
			if(event.target.id == "prev"){
				$("#text").text("���� ��� �ڷ�").css({"font-size":20,"color":"green"});
				$("#tbl" + tbl).hide();
				tbl = tbl - 1;
				if (tbl == 0) {
					tbl = 3;
				}
				$("#tbl" + tbl).show();
			}else{

				$("#text").text("���� ��� ������").css({"font-size":20,"color":"green"});
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
	�׸���
-->
<center>������ �� �� �Ǹ� ���� �˴ϴ�(���� ���� ���� �� ������ ���� �������ϴ�.).</center>
<div class="row-fluid">
	<div class="span8" style="padding-left: 30px;">
		<div id="canvas1">

			<label class="offset1 span2"
				style="padding-top: 5px; padding-left: 30px"><input
				type="checkbox" id="checkbox">���� </label> <input type="text"
				class="span3" id="wsize" name="wsize" placeholder="����  (���� :M)"
				title="grop1" /> <input type="text" class="span3" id="hsize"
				name="hsize" placeholder="����  (���� :M)" title="grop1" /> <input
				type="button" class="btn" value="����" id="save" />
			<canvas width="500" height="500" id="mycanvas1"></canvas>
		</div>
		<div hidden="true" id="canvas2">
			<h4>
				���� : <input type="text" class="span3" id="wsize2"
					placeholder="����  (���� :M)" title="grop2" /> <input type="text"
					class="span3" id="hsize2" placeholder="����  (���� :M)" title="grop2" />
				<input type="button" class="btn" value="����" id="save" />
			</h4>
			<canvas width="500" height="500" id="mycanvas2"></canvas>
		</div>

	</div>



<!--
	������ ���� â
-->


	<div class="span4" style="margin-top: 80px">
		<div align="center">
			<label id="text"></label>
		</div>

		<div class="row" align="center">

		<!-- 
			�ϴ��� ���̺�
			��ȿ�����̶� ������ ����
		-->


			<table id="tbl1">
				<tr>
					<td>
						<div class="dropdown">
							<img id="room" src="../../img/room/room.png" alt="The Scream"
								data-toggle="dropdown" title="��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="room" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="block" src="../../img/room/block.png" alt="The Scream"
								data-toggle="dropdown" title="��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="block" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="bed" src="../../img/room/bed.png" alt="The Scream"
								data-toggle="dropdown" title="ħ��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="bed" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="box" src="../../img/room/box.png" alt="The Scream"
								data-toggle="dropdown" title="����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="box" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown ">
							<img id="chair" src="../../img/room/chair.png" alt="The Scream"
								data-toggle="dropdown" title="����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="chair" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="chest-of-drawers"
								src="../../img/room/chest-of-drawers.png" alt="The Scream"
								data-toggle="dropdown" title="������" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="chest-of-drawers" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown dropup">
							<img id="desk" src="../../img/room/desk.png" alt="The Scream"
								data-toggle="dropdown" title="å��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="desk" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="dishwasher" src="../../img/room/dishwasher.png"
								alt="The Scream" data-toggle="dropdown" title="�ı⼼ô��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="dishwasher" />
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
								alt="The Scream" data-toggle="dropdown" title="���ڷ�����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="microwave" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="door" src="../../img/room/door.png" alt="The Scream"
								data-toggle="dropdown" title="����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="door" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="sofa" src="../../img/room/sofa.png" alt="The Scream"
								data-toggle="dropdown" title="����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="sofa" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="monitor" src="../../img/room/monitor.png"
								alt="The Scream" data-toggle="monitor" title="��ǻ��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="monitor" />
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
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="television" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="stool" src="../../img/room/stool.png" alt="The Scream"
								data-toggle="dropdown" title="���� ����" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="stool" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="wardrobe" src="../../img/room/wardrobe.png"
								alt="The Scream" data-toggle="dropdown" title="���" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="wardrobe" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="washing-machine"
								src="../../img/room/washing-machine.png" alt="The Scream"
								data-toggle="dropdown" title="��Ź��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="washing-machine" />
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
								alt="The Scream" data-toggle="dropdown" title="ȭ���" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="bathroom" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="pot" src="../../img/room/pot.png" alt="The Scream"
								data-toggle="dropdown" title="ȭ��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="pot" />
								</form>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="dropdown">
							<img id="instrument" src="../../img/room/instrument.png"
								alt="The Scream" data-toggle="dropdown" title="�Ǳ�" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="instrument" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="ricecooker" src="../../img/room/ricecooker.png"
								alt="The Scream" data-toggle="dropdown" title="���" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="ricecooker" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="cycle" src="../../img/room/cycle.png" alt="The Scream"
								data-toggle="dropdown" title="������" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="cycle" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="fan" src="../../img/room/fan.png" alt="The Scream"
								data-toggle="dropdown" title="��ǳ��" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="fan" />
								</form>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<img id="table" src="../../img/room/table.png" alt="The Scream"
								data-toggle="dropdown" title="��Ź" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="table" />
								</form>
							</div>
						</div>
					</td>
					<td>
						<div class="dropdown">
							<img id="vanity" src="../../img/room/vanity.png" alt="The Scream"
								data-toggle="dropdown" title="ȭ���" />
							<div class="dropdown-menu">
								<form>
									<input type="text" placeholder="���� (���� :CM)" name="w"
										class="span10" /> <input type="text"
										placeholder="���� (���� :CM)" name="h" class="span10" /> <input
										type="button" value="�����" id="vanity" />
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
	�ϴ��� ��Ʈ�ѷ����� ��Ȱ.
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
			���� ����:
			<button id="ctr" class="btn">ȸ��</button>
		</div>

	</div>
	<div class="span4">
		<div>
			<button class="btn" id="prev" title="tblpage">��</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn" id="next" title="tblpage">��</button>

		</div>
	</div>

</div>

