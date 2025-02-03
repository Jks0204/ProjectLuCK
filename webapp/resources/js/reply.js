//즉시실행함수 
// var replyService=(function(){return {add:100};)();는
// var replyService={add:100}; 과 결과적으로 같다.

var replyService=(function(){

	//js에서 함수의 이름은 reference임. 
	// callback, error parameter에는 함수를 가리키는 reference나 함수의 이름이 전달됨.
	
	//등록
	function add(reply,callback,error){
		$.ajax({
			type:"post", //전송방식
			url: "/replies/new", //서버주소
			data: JSON.stringify(reply), // 서버로 전달되는 데이터
			contentType: "application/json; charset=utf-8", //서버로 전달되는 데이터형식,
			success:function(result,status,xhr){
				if(callback){
					callback(result); // success일 때 사용하는 함수 호출
				}
			},
			error:function(xhr,status,er){
				if(error){
					error(er); // error일 때 사용하는 함수 호출. 책에서 실제로는 사용안함.
				}
			}			
		});
	}
	
	//목록
	function getList(param,callback,error){
		var bno=param.bno; //부모글번호
		var page=param.page || 1; //페이지번호. 페이지번호가 넘어오면 page변수에 저장. 페이지번호가 넘어오지 않으면 page는 1.
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",function(data){
			if(callback){
				callback(data.replyCnt,data.list);//success일 때 함수 호출
			}
		}).fail(function(xhr,status,err){
			if(error){
				error(); // error일 때 함수 호출
			}
		});
	}
	
	function displayTime(timeValue){
		var today=new Date(); //현재날짜시간
		var gap=today.getTime()-timeValue; //댓글등록이후 지난 시간
		var dateObj=new Date(timeValue); //댓글작성시간을 Date타입으로 변환
		
		//gap이 24시간이 안되면 시:분:초 출력
		if(gap<(24*60*60*1000)){
			var hh=dateObj.getHours();
			var mi=dateObj.getMinutes();
			var ss=dateObj.getSeconds();
			
			return [(hh>9?'':'0')+hh, ':' , (mi>9?'':'0')+mi , ':' , (ss>9?'':'0')+ss].join('');
		}else{
			var yy=dateObj.getFullYear();
			var mm=dateObj.getMonth()+1;
			var dd=dateObj.getDate();
			
			return [yy, '/', (mm>9?'':'0')+mm, '/', (dd>9?'':'0')+dd ].join('');
		}
	}
	
	
	
	function get(rno,callback,error){
		//get방식 전용
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function update(reply,callback,error){
		$.ajax({
			type:"put",  // update시에는 put or patch 타입으로 전송
			url:"/replies/"+reply.rno, //서버주소
			data:JSON.stringify(reply), //서버로 전송되는 데이터
			contentType:"application/json;charset=utf-8", //서버로 전송되는 데이터의 형식
			success:function(result,status,xhr){ //성공시 호출하는 함수
				if(callback){
					callback(result);
				}
			},
			error:function(xhr,status,er){ //에러시 호출하는 함수
				if(error){
					error(e);
				}
			}
		});
	}
	
	function remove(rno,callback,error){
		$.ajax({
			type:"delete", //전송방식
			url:"/replies/"+rno, //서버주소
			success:function(deleteResult,status,xhr){ //성공했을 때 호출하는 함수
				if(callback){
					callback(deleteResult);
				}
			},
			error:function(xhr,status,er){ //에러났을 때 호출하는 함수
				if(error){
					error(e);
				}
			}
		});
	}
	
	
	return {add:add, get:get, getList:getList, displayTime:displayTime, update:update, remove:remove};

})();