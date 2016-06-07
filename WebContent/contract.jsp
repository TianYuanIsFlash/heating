<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>居民供暖管理系统</title>

<!-- 引入 Bootstrap -->
  <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
  <script src="jQuery/jquery-1.11.3.min.js"></script>
  <!-- 包括所有已编译的插件 -->
  <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>  
  <!-- 包括JS文件，放置头文件 -->
  <script src="js/headJquery.js"></script> 
  <!--引入我的CSS-->
  <link href="css/QuickEnter.css" rel="stylesheet">

  <!--title前logo-->
  <link rel="icon" href="img/hotIcon.png" type="image/x-icon"/>

  <style type="text/css">
    body{
    background-image:url(img/cbg.jpg);
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-position: -90px 180px;
	background-size:1200px 492px;
	overflow: hidden; 
    }
    
	#contractPage1{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}

    #contractPage2{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}

	#contractPage3{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}

	#contractPage4{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}
	
	#contractPage5{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}
	
	#contractPage6{
	margin-left:auto;
    margin-right:auto;
	width:210mm;
	height:297mm;
	border:green 0px solid;
	}

	.page{
    width:63mm;	
	position:fixed;
	top:200px;
	right:1px;
	
	}
	
	
  </style>
  
  
  <script type="text/javascript">document.onmousewheel = function() {return false;}</script>
  
  
  
  
  <script type="text/javascript">

  $(document).ready(function(){
	  $("#dayin").on("click",function(){
		  alert("请连接打印机！");
	  });
	  
	  
	  $("#pbtn1").on("click",function(){
		   $("#contractPage1").show();
		   $("#contractPage2").css("display","none");
		   $("#contractPage3").css("display","none");
		   $("#contractPage4").css("display","none");
		   $("#contractPage5").css("display","none");
		   $("#contractPage6").css("display","none");
	   });
	  $("#pbtn2").on("click",function(){
		   $("#contractPage2").show();
		   $("#contractPage1").css("display","none");
		   $("#contractPage3").css("display","none");
		   $("#contractPage4").css("display","none");
		   $("#contractPage5").css("display","none");
		   $("#contractPage6").css("display","none");
	   });
	  $("#pbtn3").on("click",function(){
		   $("#contractPage3").show();
		   $("#contractPage2").css("display","none");
		   $("#contractPage1").css("display","none");
		   $("#contractPage4").css("display","none");
		   $("#contractPage5").css("display","none");
		   $("#contractPage6").css("display","none");
	   });
	  $("#pbtn4").on("click",function(){
		   $("#contractPage4").show();		   
		   $("#contractPage2").css("display","none");
		   $("#contractPage3").css("display","none");
		   $("#contractPage1").css("display","none");
		   $("#contractPage5").css("display","none");
		   $("#contractPage6").css("display","none");
	   });
	  $("#pbtn5").on("click",function(){
		   $("#contractPage5").show();
		   $("#contractPage2").css("display","none");
		   $("#contractPage3").css("display","none");
		   $("#contractPage4").css("display","none");
		   $("#contractPage1").css("display","none");
		   $("#contractPage6").css("display","none");
	   });
	  $("#pbtn6").on("click",function(){
		   $("#contractPage6").show();
		   $("#contractPage2").css("display","none");
		   $("#contractPage3").css("display","none");
		   $("#contractPage4").css("display","none");
		   $("#contractPage5").css("display","none");
		   $("#contractPage1").css("display","none");
	   });
	  
	  $.ajax({
		  type:"post",
		  url:"contractAction",
		  dataType:"json",
		  success:function(data){
			  $.each(data.array,function(index){
				  $.each(data.array[index],function(key,value){
					  
					  if(key=="user"){$(".user").html(value);}
					  if(key=="adress"){$(".adress").html(value);}
					  if(key=="area"){$(".area").html(value);}
					  if(key=="charge"){$(".charge").html(value);}
					  if(key=="idno"){$(".idno").html(value);}
					  if(key=="phoneno"){$(".phoneno").html(value);}
					  
				  });
			  });
		  },error:function(){
			  
		  }	  
	  });
  });
  
  </script>
</head>
<body>

<div class="page-header">
   <h3><a href="quickdoor.jsp" class="glyphicon glyphicon-home">居民供暖管理系统</a>
  
   
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 180px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("user") %></span></small>
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 80px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("type") %></span></small>
       <small id="nowDiv" style="position: absolute;right: 33px;top: 60px;"><span><a href="index.html" class="glyphicon glyphicon-log-out"></a></span></small>
	  
   </h3>
  </div>


<div id="loadHead">

</div> 
  
<hr>


 <div class="page">
    <span>第</span>
	<button id="pbtn1">1</button>
	<button id="pbtn2">2</button>
	<button id="pbtn3">3</button>
	<button id="pbtn4">4</button>
	<button id="pbtn5">5</button>
	<button id="pbtn6">6</button>
	<span>页</span>
	<br>
	<br>
	
	<div ><a id="dayin"><button>打印</button></a></div>
 </div>
<h2 align="center">房屋供热采暖合同</h2>
  <div id="contractPage1">   
    <p>用热人（甲方）：<u>天津市政供暖</u>_____________________________________________________</p>
    <p>供热人（乙方）：<u class="user" style="color: blue;"></u>___________________________________________________________________</p>
	<p>&nbsp&nbsp根据《中华人民共和国合同法》、《中华人民共和国消费者权益保护法》、《北京市供热采暖管理办法》（简称《办法》）等法律、法规和规章的规定，甲乙双方在自愿、平等、公平、诚实信用的基础上，协商订立本合同。</p>
    <h3>&nbsp&nbsp第一条 供热采暖地点、采暖计费面积</h3>
	<p>&nbsp&nbsp 1.供热设施地点：<u class="adress" style="color: blue;"></u>____________________________________________</p>
	<p>&nbsp&nbsp&nbsp&nbsp采暖地点：<u class="adress" style="color: blue;"></u>___________________________________________________</p>
	<p>&nbsp&nbsp&nbsp&nbsp本项目供暖节能状况参照住宅建筑节能状况: </p>
	<p>&nbsp&nbsp&nbsp&nbsp□ 符合现行国家住宅设计规范的节能建筑。</p>
	<p>&nbsp&nbsp&nbsp&nbsp□ 经过建筑围护结构改造和供热系统改造的建筑。</p>
	<p>&nbsp&nbsp&nbsp&nbsp□ 未经建筑围护结构改造或供热系统改造的建筑。</p>
	<p>&nbsp&nbsp 2.采暖计费面积为：___<u class="area" style="color: blue;"></u>___平方米，其中单层建筑高度超过4米的建筑面积为______平方米。</p>
	<p>&nbsp&nbsp （1）房屋所有权证记载的建筑面积为___<u class="area" style="color: blue;"></u>___平方米；尚未取得房屋所有权证的，以建筑物竣工图纸标明的建筑面积或房屋买卖合同载明的建筑面积为准，计______平方米，甲方取得房屋所有权证后，以房屋所有权证记载的建筑面积为准。</p>
	<p>&nbsp&nbsp 房屋所有权证、公有住房租赁凭证上仅记载使用面积的，应当按房管部门规定的系数折算成建筑面积后计收采暖费。</p>
	</div>
	<div id="contractPage2">
	<p>&nbsp&nbsp （2）采暖的其他建筑面积为 ______ 平方米。对此部分建筑面积有争议的，以乙方委托的房屋测绘部门出具的测绘数据为准，测绘费由乙方承担。</p>
	<h3>&nbsp&nbsp第二条 采暖期</h3>
	<p>&nbsp&nbsp 采暖期为每年11月15日至次年3月15日。采暖期调整应当按北京市人民政府的决定执行。</p>
	<h3>&nbsp&nbsp第三条 供热室内温度标准</h3>
	<p>&nbsp&nbsp 采暖期内，乙方室内温度参照“北京市住宅供暖合同”执行。即：在正常天气情况下，对符合现行国家住宅设计规范要求的住宅，或经过建筑围护结构和供热系统改造的住宅，乙方应当保证甲方房屋的温度不低于18℃；未经建筑围护结构改造或供热系统改造的住宅，当室外日平均气温在－7℃以上时，房屋温度应当不低于18℃，当室外日平均气温在－7℃以下、－9℃以上（含）时，房屋温度应当不低于16℃。</p>	
	<h3>&nbsp&nbsp第四条 采暖费缴费标准、期限及方式</h3>
	<p>&nbsp&nbsp 1.缴费标准</p>	
	<p>&nbsp&nbsp 采暖费以建筑面积为计费依据，标准为价格主管部门规定的<u>  7.5  </u>元/建筑平方米/采暖季；单层建筑高度超过4米的部分，缴费标准为<u>  36  </u>元/建筑平方米/采暖季/吉焦。</p>
	<p>&nbsp&nbsp 采暖费总计：_____<u class="charge" style="color: blue;"></u>_____元/采暖季。</p>
	<p>&nbsp&nbsp 如遇价格主管部门调整采暖费缴费标准的，应当自调整之日起按调整后的标准计算采暖费。</p>
	<p>&nbsp&nbsp 2.缴费期限</p>
	<p>&nbsp&nbsp 每年5月1日至12月31日，甲方应当将本采暖季（当年11月15日至次年3月15日）的采暖费足额支付给乙方。逾期未支付或未足额支付的，自次年1月1日起将计收未支付部分的逾期违约金。</p>       
	</div>	
	<div id="contractPage3">	
	<p>&nbsp&nbsp 3.采暖费采取下列方式支付：</p>
	<p>&nbsp&nbsp □ 直接向乙方支付；</p>
	<p>&nbsp&nbsp □ 缴至乙方指定的金融机构；</p>
	<p>&nbsp&nbsp □ 缴至乙方委托的其他代收单位：_______________________________________。</p>
	<h3>&nbsp&nbsp 第五条 甲方权利义务</h3>
	<p>&nbsp&nbsp 1.有权要求乙方按合同约定的地点、时间和温度标准供热。</p>	
	<p>&nbsp&nbsp 2.应当按合同约定的期限、方式和金额支付采暖费，并有权要求收费单位提供国税机关统一印制的采暖费发票或乙方指定的金融机构开具的采暖费缴费凭证；不能提供采暖费发票或采暖费缴费凭证的，甲方有权拒缴采暖费。对缴费数额有异议的，有权要求乙方予以核对。</p>
	<p>&nbsp&nbsp 3.应当对室内自用采暖设施进行管护，对超出使用年限、影响采暖质量、存在安全隐患的自用采暖设施应当及时更新、改造；接到乙方发出的自用采暖设施隐患整改通知后，应当及时采取措施消除隐患。</p>
	<p>&nbsp&nbsp 4.应当承担室内自用采暖设施日常维修的材料费和更新改造费用。因自行改变房屋结构或装饰装修影响供热设施维修作业的，有关拆除及恢复的费用由甲方承担。</p>
	<p>&nbsp&nbsp 5.不得拆改室内共用供热设施、扩大采暖面积或增加散热设备。拆改自用采暖设施的，不得影响其他用热人正常采暖，不得妨碍对共用供热设施的维修和检查，并应当对拆改产生的后果承担责任。发现室内供热设施有异常、泄漏等情况时，应当及时向乙方报修。</p>
	<p>&nbsp&nbsp 6.应当在乙方进行供热系统充水、试压、排气及试运行等工作时留人监守；在乙方进行维修、排气、室温抽测、查表、收费或采取紧急避险措施需要入户作业时，应当予以配合。</p>
	<p>&nbsp&nbsp 7.应当遵守供热设施安全使用方面的规定，履行《办法》及本合同其他条款中规定的应当由其承担的义务。</p>
	<h3>&nbsp&nbsp第六条 乙方权利义务</h3>
	<p>&nbsp&nbsp 1.应当按合同约定的地点、时间和温度标准向甲方提供安全、稳定的供热服务，加强运行工况调节，保证采暖期内甲方室内温度持续达标，并按北京市的规定定期进行免费室温抽测。</p>
	<p>&nbsp&nbsp 2.应当对甲方的采暖情况、用热设施的运行状况进行巡检。在巡检中发现甲方的自用采暖设施存在安全隐患、影响其他用热人正常采暖、因自行改变房屋结构或装饰装修妨碍供热设施维修作业及其他违反《办法》和本合同约定的情况的，应当在采暖季开始30日之前书面通知甲方及时整改。</p>
	<p>&nbsp&nbsp 3.有权按合同约定收取采暖费。在收取采暖费后，应当开具正式发票。</p>
	<p>&nbsp&nbsp 4.供热前进行供热系统充水、试压、排气及试运行等工作时，应当提前7日在住宅单元门口或电梯口等明显位臵进行公示，告知甲方留人监守。</p>
	<p>&nbsp&nbsp 5.按《供热采暖系统管理规范》（DB11/T598-2008）、《供热采暖系统维修管理规范》（DB11/T466-2007）等供热服务标准、规范提供服务，公布值班、报修电话，并在采暖期内安排人员24小时值守。
	报修电话号码为：<u>022-88888888</u>______________________________________。</p>
	<p>&nbsp&nbsp 采暖期内接到甲方报修后，乙方应当在1小时内回复甲方；供热</p>
	<p>&nbsp&nbsp 采暖设施出现泄漏等紧急情况的，乙方应当立即处臵；出现温度不达标等情况的，乙方应当在6小时内告知甲方处臵情况。</p>
	<p>&nbsp&nbsp 6.乙方应当在营业场所、企业网站、公开栏、办事大厅等处，公开下列供热服务信息，并在信息发生变化时及时公告：</p>
	<p>&nbsp&nbsp （1）供热缴费、维修及相关服务办理程序、时间、网点设臵、服务标准及承诺；</p>
	<p>&nbsp&nbsp （2）停热及恢复供热信息、巡检及查表信息；</p>
	<p>&nbsp&nbsp （3）供热及供热设施安全使用规定、常识和安全提示；</p>
	</div>
	<div id="contractPage4">
	<p>&nbsp&nbsp （4）咨询服务电话、报修和救援电话、监督投诉电话；</p>
	<p>&nbsp&nbsp （5）国家和本市与供热服务有关的规定、标准等。</p>
	<p>&nbsp&nbsp 7.采暖期内，乙方因所维护管理的供热设施故障、事故等情况影响用热人正常采暖的，应当及时公告，并迅速采取有效措施，及时消除影响。</p>
	<p>&nbsp&nbsp 8.履行《办法》及本合同其他条款中规定的应当由其承担的义务。 </p>
	<h3>&nbsp&nbsp第七条 违约责任</h3>
	<p>&nbsp&nbsp （一）甲方违约责任</p>
	<p>&nbsp&nbsp 1.甲方未按合同约定的时间及数额支付采暖费的，除须按合同约定支付采暖费本金外，还应当自逾期之日起按中国人民银行公布的贷款利率标准，向乙方支付违约金（每逾期一日，应交纳欠费总额的3‰作为滞纳金）。</p>
	<p>&nbsp&nbsp 2.甲方因室内自用采暖设施泄漏、擅自拆改室内供热设施产生泄漏或影响其他用热人采暖、未按合同约定履行应当由其承担的设施管护义务、私自取用供热系统用水、拒绝乙方入户作业、拒绝乙方提出的设施隐患整改建议，或发生其他违反《办法》和本合同规定的用热行为，造成自身、其他用热人、乙方或公共利益损失的，除承担自身损失外，还应当承担相应的赔偿责任。</p>
	<p>&nbsp&nbsp （二）乙方违约责任</p>
	<p>&nbsp&nbsp 1.乙方未按合同约定时间向甲方供热的，应当按未供热天数退还相应采暖费，并承担其他相应责任。</p>
	<p>&nbsp&nbsp 退费额=日平均热费×未供热天数</p>
	<p>&nbsp&nbsp 日平均热费=采暖费总额/本采暖季法定供热天数</p>
	<p>&nbsp&nbsp 2.经双方共同确认或第三方检测机构认定，甲方房屋室内温度未达到本合同约定标准的，应当退还相应的采暖费，并承担其他相应责任。</p>
	<p>&nbsp&nbsp （1）退费额=日热费单价×温度未达到约定标准的房屋建筑面积×温度未达到约定标准的天数×退费比例</p>
	<p>&nbsp&nbsp 日热费单价=采暖费总额/（本采暖季法定供热天数×计费建筑面积）</p>
	<p>&nbsp&nbsp 房屋建筑面积以房屋竣工图纸标明的建筑面积为准。没有竣工图纸的，双方协商确定退费部分的建筑面积；协商不成的，以乙方委托的房屋测绘部门出具的测绘数据为准，测绘费由乙方承担。</p>
	<p>&nbsp&nbsp 退费比例按房屋约定采暖温度计：</p>
	<p>&nbsp&nbsp 室内温度低于约定温度2度之内的，退费比例为40％；室内温度低于约定温度2度（含）以上、4度以下的，退费比例为60％；室内温度低于约定温度4度（含）以上的，退费比例为100％。</p>
	<p>&nbsp&nbsp （2）甲方房屋室内温度未达到约定的天数按以下情形计算：</p>
	<p>&nbsp&nbsp ①甲方发现室内温度未达到约定标准应当首先向乙方报修，乙方应当在接到甲方报修后6小时内入户测温，并进行调节和检修。</p>
	<p>&nbsp&nbsp ②自甲方报修之时起，24小时之内经乙方调节、检修，温度达到约定标准的，不计入退费天数；24小时内经乙方调节、检修，仍未达到约定标准的，自甲方报修当日起至温度达到约定标准日止的天数，计入退费天数。</p>
	<p>&nbsp&nbsp ③双方对室内温度存在争议的，任一方均可委托经本市有关部门认定的第三方检测机构进行室温检测。双方委托不同的检测机构测温时，以甲方委托检测机构的检测数据为准。经检测，温度符合标准的，检测费由甲方承担；温度不符合标准的，检测费由乙方承担。 
（3）有下列情况之一，导致甲方房屋室内温度未达到约定标准的，乙方免予承担违约责任，但应当提供相应证明： 
①甲方擅自改动居室结构、采暖设施或增加采暖面积的，以及因装饰装修、保温措施不当影响供热效果的; 
②甲方拒绝乙方入户作业的； 
③市人民政府决定对天然气、电力、自来水采取限量供应措施的； ④室外日平均气温低于－9℃的； 
⑤乙方因设施安全检修需停热的，但不得超过6小时，且已提前公告，整个采暖季累计不超过3次。 
3.乙方未尽到管护义务，导致甲方室内的共用供热设施出现泄漏，造成甲方、其他用热人和公共设施损失的，乙方应当承担赔偿责任。 
</p>
<h3>&nbsp&nbsp第八条 合同的变更</h3> 
    </div>
	<div id="contractPage5">
	<p>&nbsp&nbsp 1.采暖建筑物的产权关系或公有住房承租关系发生变更时，甲方应当及时书面告知乙方，并与乙方解除本合同，采暖费用一并结清。 
</p>
	<p>&nbsp&nbsp 甲方未书面告知乙方房屋产权人或公用住房承租关系的变更情况的，甲方应当继续承担本合同项下的义务。</p>
	<p>&nbsp&nbsp 2.本合同如有未尽事宜，或因采暖面积、双方的电话、地址等有关信息发生变更或其他供采暖情况发生变更，或甲方对采暖期时间、室内温度有特殊要求且甲方居住区具备实施条件，需要修改本合同有关条款的，经双方协商一致可另行签订补充协议作为本合同附件。</p>
	<h3>&nbsp&nbsp第九条 合同的生效</h3>	
	<p>&nbsp&nbsp 本合同自双方签字、盖章之日起生效，如遇国家对供暖费用的价格作出相关调整（须有具体正式批文），物业公司将按照国家新的政策重新与业主签定供暖合同。否则双方将延续执行此合同。</p>
	<h3>&nbsp&nbsp第十条 争议解决方式</h3>	
	<p>&nbsp&nbsp 本合同项下发生的民事争议，由双方协商解决，或向消费者协会、供热协会、供热主管部门申请调解解决；协商解决或调解解决不成的，可以向有管辖权的人民法院提起诉讼，或按另行达成的仲裁协议申请仲裁。</p>
	<h3>&nbsp&nbsp第十一条 其他约定</h3>
	<p>&nbsp&nbsp 本合同正本一式 <u>     两  </u>份，甲方<u>  一  </u>份，乙方<u>  一  </u>份。本合同正文及附件等均为本合同组成部分，具有同等法律效力。 
本合同约定事项为基本要求，双方另行约定的事项不得低于本合同约定。法律、法规、规章和标准、规范对合同内容另有强制性规定的，从其规定。</p>
    <p>&nbsp&nbsp </p>
	<p>&nbsp&nbsp </p>
	</div>
    <div id="contractPage6">
	<table>
	<tr>
	<td>&nbsp&nbsp 用热人(签字)：</td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 供热人(盖章)：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 身份证号：<u class="idno" style="color: blue;"></u></td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 营业执照号/法人登记证书号：<u>8888888888</u></td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 住宅电话：<u class="phoneno" style="color: blue;"></u></td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 备案登记号：<u>8888888888</u></td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 手机号码：<u class="phoneno" style="color: blue;"></u></td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 锅炉房编码：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 通信地址：<u class="adress" style="color: blue;"></u></td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 法定代表人：<u>XXXXXX</u></td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 邮政编码：<u>300330</u></td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 委托代理人(签字)：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 委托代理人：</td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 通信地址：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 应急联系人：</td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 邮政编码：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 应急联系电话：</td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 联系电话：</td>
	</tr>

	<tr>
	<td>&nbsp&nbsp 年    月    日 </td>
	<td>&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp&nbsp 年    月    日 </td>
	</tr>
	
	</table>
	
	<p>&nbsp&nbsp </p>
	

  </div>
  
</body>
</html>