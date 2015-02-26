
import com.greensock.*;
import com.greensock.easing.*;

//ENDRE EFFEKT OG TID PÅ BANNER

freezeIt = 4; // Definer antall sekunder hver slide skal stå stille.
hastighet = 1; // Definer hvor lang tid (sekunder) hver overgang skal ta.



trace(_root.freezeIt);
slide1Pos = slide1._y;
slide2Pos = slide2._y;


yPos = startPos._y;
yPosEnd=endPos._y;

startPos._alpha = 0;
endPos._alpha = 0;


function kickOFFtheShit() {
   stop();
   var myInterval = setInterval(function () {
      animerUt();
	  resetSlide2();
	  animerInn2();
      clearInterval(myInterval);
   }, freezeIt*1000);
   animerInn();
}

function repeatSlides() {
   stop();
   var myInterval = setInterval(function () {
      animerUt2();
	  resetSlide1();
	  kickOFFtheShit();
      clearInterval(myInterval);
   }, freezeIt*1000);

}


function resetSlide1(){

	slide1._y=yPos;
	slide1._alpha=0;

}

function resetSlide2(){

	slide2._y = yPos;
	slide2._alpha=0;

}



function animerInn(){
	TweenLite.to(slide1, hastighet, {_y:slide1Pos,_alpha:100, /*_y:101,*/ ease:Elastic.easeInOut});
}

function animerInn2(){
	TweenLite.to(slide2, hastighet, {_y:slide2Pos,_alpha:100, /*_y:101,*/ ease:Elastic.easeInOut});
}

function animerUt(){
	TweenLite.to(slide1, hastighet, {_y:yPosEnd,_alpha:0, /*_y:101,*/ ease:Elastic.easeInOut});
	repeatSlides();
	
}

function animerUt2(){
	TweenLite.to(slide2, hastighet, {_y:yPosEnd,_alpha:0, /*_y:101,*/ ease:Elastic.easeInOut});
}



kickOFFtheShit();
resetSlide1();
resetSlide2();
