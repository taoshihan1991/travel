/*
 * Abstract   ：IPOW js
 * Author     ：CaiYing	
 * Time       ：2014.12.15
 */

/*common*/

//hover
 // 移动设备判断并跳转
var isMobile = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);
if (isMobile) {

function Hover(obj){
	var _this = this;
	this.obj = obj;
	this.oldClass = this.obj.className ;
	
	this.obj.addEventListener('touchstart',function(){
		_this.obj.className = _this.oldClass+" hover";
		//alert(_this.obj.className);
	}, false);

　　 this.obj.addEventListener('touchend',function(){
		_this.obj.className = _this.oldClass;
		//console.log(_this.obj.className);
	}, false);
    
	//console.log(_this.obj);
}

if( getByClass02("iMidNav")[0]){
	//alert(getByClass02("iMidNav")[0]);
	//alert(getByClass02("iCaseList")[0]);
	var aHover = getByClass02("iMidNav")[0].getElementsByTagName("a");
	
	for(var i=0; i<aHover.length; i++){
		new Hover(aHover[i]);
	}
	//console.log(aHover.length);

}
if( document.getElementById("iCaseList01") ){
	//alert(document.getElementById("iCaseList01");
	var aHover = getByClass(document.getElementById("iCaseList01"),"item");
	
	for(var i=0; i<aHover.length; i++){
		new Hover(aHover[i]);
	}
	//console.log(aHover.length);

}
if( document.getElementById("iCaseList02") ){
	//alert(getByClass02("iCaseList")[0]);
	var aHover = getByClass(document.getElementById("iCaseList02"),"item");
	
	for(var i=0; i<aHover.length; i++){
		new Hover(aHover[i]);
	}
	//console.log(aHover.length);
}
if( getByClass02("lookMore")[0] ){
	for(var i=0; i<getByClass02("lookMore").length ; i++){

		var aHover = getByClass02("lookMore")[i];
		new Hover(aHover);
	}
}
if( getByClass02("iClientList")[0]){
	var aHover = getByClass(getByClass02("iClientList")[0],"item");
	
	for(var i=0; i<aHover.length; i++){
		new Hover(aHover[i]);
	}
	//console.log(aHover.length);
}
// if( document.getElementById("caseList") ){
// 	//alert(document.getElementById("iCaseList01");
// 	var aHover = getByClass(document.getElementById("caseList"),"item");
	
// 	for(var i=0; i<aHover.length; i++){
// 		new Hover(aHover[i]);
// 	}
// 	//console.log(aHover.length);

// }


}






/*index*/
if(document.getElementById("banner")){
	new Banner();
}

function Banner(){
	var _this = this;
	this.parBanner = document.getElementById("banner");
	this.pic = getByClass(this.parBanner,"bannerPic")[0];
	this.aPic = this.pic.getElementsByTagName("a");
	this.icon = getByClass(this.parBanner,"bannerIcon")[0];

	for( var i=0; i<this.aPic.length ; i++){
		if( i==0 ){
			this.icon.innerHTML = '<a class="active" href="javascript:;" ></a>';
		}else {
			this.icon.innerHTML+='<a href="javascript:;" ></a>';
		}
	}

	this.aIcon = this.icon.getElementsByTagName("a");
	this.btnPrev = getByClass(this.parBanner,"prev")[0];
	this.btnNext = getByClass(this.parBanner,"next")[0];
	this.pos = 0;

	this.timer = setInterval(function(){
		if(_this.pos < _this.aPic.length-1 ){
			_this.pos++;
		}else {
			_this.pos = 0 ;
		}
		_this.fnAni();
	},5000);

	this.btnPrev.onclick = function(){
		if(_this.pos > 0){
			_this.pos--;
		}else {
			_this.pos = _this.aPic.length-1;
		}
		_this.fnAni();
	}
	this.btnNext.onclick = function(){
		if(_this.pos < _this.aPic.length-1 ){
			_this.pos++;
		}else {
			_this.pos = 0 ;
		}
		_this.fnAni();
	}
	this.btnNext.onmouseover = this.btnPrev.onmouseover = function(){
		clearInterval(_this.timer);
	}
	this.btnNext.onmouseout = this.btnPrev.onmouseout = function(){
		_this.timer = setInterval(function(){
			if(_this.pos < _this.aPic.length-1 ){
				_this.pos++;
			}else {
				_this.pos = 0 ;
			}
			_this.fnAni();
		},5000);
	}
	for( var i=0; i<this.aPic.length ; i++){
		this.aIcon[i].index = i;
		this.aIcon[i].onmouseover = function(){
			clearInterval(_this.timer);
		}
		this.aIcon[i].onmouseout = function(){
			_this.timer = setInterval(function(){
				if(_this.pos < _this.aPic.length-1 ){
					_this.pos++;
				}else {
					_this.pos = 0 ;
				}
				_this.fnAni();
			},5000);
		}
		this.aIcon[i].onclick = function(){
			_this.pos = this.index;
			_this.fnAni();
		}
		//触摸
		var startX = 0;
		var iLeft = 0; 
		var x=0;
		var touch = null; 
		 if (isMobile) {
		this.aPic[i].addEventListener('touchstart',function(event){
			if (event.targetTouches.length == 1){
				clearInterval(_this.timer);
				touch = event.targetTouches[0];
				startX = touch.clientX ;
				startY = touch.clientY ;
				iLeft = _this.pic.offsetLeft ;
			}
		},false);
		this.aPic[i].addEventListener('touchmove', function(event) {
		  // 如果这个元素的位置内只有一个手指的话
		  if (event.targetTouches.length == 1) {
			touch = event.targetTouches[0];
			x = Number(touch.pageX); //页面触点X坐标  
			_this.pic.style.left = iLeft+x-startX+"px" ; 
		  }
		}, false);

		this.aPic[i].addEventListener('touchend',function(event){
			//运动
			//console.log(x-startX );
			if( x-startX > 50){
				if( _this.pos >0 ){
					_this.pos-- ;
				}
				_this.fnAni();
			}else if( x-startX < -50){
				if( _this.pos < _this.aPic.length-1 ){
					_this.pos++ ;
				}
				_this.fnAni();
			}else {
				startMove ( _this.pic , { "left" : iLeft } ,5 ) ;
			}
		},false);
	}


	}
	Banner.prototype.fnAni = function(){
		var iWidth = document.body.clientWidth;
		//console.log(iWidth);
		for( var i=0; i<this.aPic.length ; i++){
			this.aIcon[i].className = "null"; 
		}
		this.aIcon[this.pos].className = "active"; 
		startMove(this.pic,{"left":-this.pos*iWidth},6);
	}






}
 

$(function() {
	//首页
	if($('.iCaseList')[0]){
		var $container01 = $('.iCaseList');
		$container01.imagesLoaded(function() {
			$container01.masonry({
				itemSelector: '.item',
				gutterWidth: 0,
				isAnimated: true,
				columnWidth : '.nItem'
			});
		});	
	}
	//案列列表
	// var $container02 = $('.caseList');
	// $container02.imagesLoaded(function() {
	// 	$container02.masonry({
	// 		itemSelector: '.item',
	// 		gutterWidth: 0,
	// 		isAnimated: true,
	// 		columnWidth : '.nItem'
	// 	});
	// 	$container02.css("width","100%");
	// });
	//我们的团队
	if($('.aboutUsPic')[0]){
		var $container = $('.aboutUsPic');
		$container.imagesLoaded(function() {
			$container.masonry({
				itemSelector: '.item',
				gutterWidth: 0,
				isAnimated: true,
				columnWidth : '.nItem'
			});
		});
	}
	
});

//Contact Us
if( document.getElementById("contactWx")){
	ContactWx();
}
function ContactWx(){
	var oWx = document.getElementById("contactWx");
	var oWxImg = oWx.getElementsByTagName("img")[0];
	var timerWx = null;
	
	
	oWxImg.onmouseover = oWx.onmouseover = function(){
        //clearTimeout(timerWx);
		oWxImg.style.display = "block";
	}

	oWxImg.onmouseout = oWx.onmouseout = function(){
		 oWxImg.style.display = "none";
        /*timerWx = setTimeout(function(){
            oWxImg.style.display = "none";
        },500)*/
	}

}

//JoinUs
if( getByClass02("jobCon")[0]){
	new Job();
}
function Job(){
	var _this = this;
	this.parJob = getByClass02("jobCon")[0];
	this.aMenu = getByClass02("jobMenu")[0].getElementsByTagName("a");
	this.aCon = getByClass02("jobItemWrap");
	this.pos = 0; 

	for( var z=0; z<this.aMenu.length ; z++){
		this.aMenu[z].index = z;
		this.aMenu[z].onclick = function(){
			_this.pos = this.index;
			_this.fnAni();
		}
	}
	
	Job.prototype.fnAni = function(){
		var iTop = parseInt(document.getElementById("bannerN").clientHeight)+100+100;
		for( var i=0; i<this.pos ; i++){
			iTop += parseInt(this.aCon[i].clientHeight);
		}
		document.documentElement.scrollTop = iTop;
		document.body.scrollTop = iTop;
	}
}


//CASE
if (getByClass02("pageChange")[0]) {
	fnCase();
};
function fnCase(){
	var arrLink = [
		["/Case/site/2014gzchimelong/index.shtml","广州长隆旅游度假区"],
		["/Case/site/2014zhchimelonghotel/index.shtml","珠海横琴湾酒店"],
		["/Case/site/2014cdApp/index.shtml","成都欢乐谷智慧旅游APP"],
		["/Case/site/2014tjhappy/index.shtml","天津欢乐谷"],
		["/Case/site/2012hyanimal/index.shtml","杭州野生动物世界"],
		["/Case/site/2012sc/index.shtml","宋城集团"],
		["/Case/site/2012hqw/index.shtml","珠海海泉湾"],
		["/Case/site/2013shhappy/index.shtml","上海欢乐谷"],
		["/Case/site/2014llmx/index.shtml","厦门灵玲国际马戏城"],
		["/Case/site/2013octshow/index.shtml","华侨城演艺"],
		["/Case/site/2014zhchimelong/index.shtml","珠海长隆"],
		["/Case/site/2014gzchimelonghotel/index.shtml","广州长隆酒店"],
		["/Case/site/2013baxian/index.shtml","蓬莱八仙过海"],
		["/Case/site/2013whmaya/index.shtml","武汉玛雅水公园"],
		["/Case/site/2014szhappy/index.shtml","深圳欢乐谷"],
		["/Case/site/2013whhappy/index.shtml","武汉欢乐谷"],
		["/Case/site/2013chimelongproperty/index.shtml","长隆地产"],
		["/Case/site/2012chuanloo/index.shtml","长鹿农庄"],
		["/Case/site/2012bjhappy/index.shtml","北京欢乐谷"],
		["/Case/site/2014cdhappy/index.shtml","成都欢乐谷"],
		["/Case/site/2014fengleyuan/index.shtml","丰乐园官方网站"],
		["/Case/site/2011xzal/index.shtml","徐州乐园"],
		["/Case/site/2014szal/index.shtml","苏州乐园"],
		["/Case/site/2012mxdpark/index.shtml","浙江冒险岛水世界"],
		["/Case/site/2013chimelongcircus/index.shtml","长隆国际大马戏"],
		["/Case/site/2014octjstz/index.shtml","泰州华侨城"]
	];
	var parPage = getByClass02("pageChange")[0],
		btnPrev = getByClass(parPage,"prev")[0],
		prevTitle = btnPrev.getElementsByTagName("h4")[0],
		btnNext = getByClass(parPage,"next")[0],
		nextTitle = btnNext.getElementsByTagName("h4")[0];

	var prevNum = Math.floor(Math.random()*arrLink.length);
	var nextNum = 0;
	do {
		nextNum = Math.floor(Math.random()*arrLink.length);
	}
	while ( nextNum == prevNum );

	btnPrev.href = arrLink[prevNum][0];
	prevTitle.innerHTML = arrLink[prevNum][1];
	
	btnNext.href = arrLink[nextNum][0];
	nextTitle.innerHTML = arrLink[nextNum][1];
	console.log(nextNum+":"+prevNum);

}