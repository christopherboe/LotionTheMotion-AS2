
import com.greensock.*;
import com.greensock.easing.*;

//ENDRE EFFEKT OG TID PÅ BANNER

freezeIt = 5; // Definer antall sekunder hver slide skal stå stille.
hastighet = 1; // Definer hvor lang tid (sekunder) hver overgang skal ta.
animEffect = Quad; // Velg effect: Quad, Elastic, Bounce
easeEffect = easeOut; // Velg Ease: easeIn, easeOut, easeInOut

//Se flere effekter på GSAP sine nettsider


slide1Pos = slide1._x;
slide2Pos = slide2._x;


xPos = startPos._x;
xPosEnd=endPos._x;

startPos._alpha = 0;
endPos._alpha = 0;


function kickOFFtheShit() {
   stop();
   var mxInterval = setInterval(function () {
      animerUt();
	  resetSlide2();
	  animerInn2();
      clearInterval(mxInterval);
   }, freezeIt*1000);
   animerInn();
}

function repeatSlides() {
   stop();
   var mxInterval = setInterval(function () {
      animerUt2();
	  resetSlide1();
	  kickOFFtheShit();
      clearInterval(mxInterval);
   }, freezeIt*1000);

}


function resetSlide1(){

	slide1._x=xPos;
	slide1._alpha=0;

}

function resetSlide2(){

	slide2._x = xPos;
	slide2._alpha=0;

}



function animerInn(){
	TweenLite.to(slide1, hastighet, {_x:slide1Pos,_alpha:100, /*_x:101,*/ ease:animEffect.easeEffect});
}

function animerInn2(){
	TweenLite.to(slide2, hastighet, {_x:slide2Pos,_alpha:100, /*_x:101,*/ ease:animEffect.easeEffect});
}

function animerUt(){
	TweenLite.to(slide1, hastighet, {_x:xPosEnd,_alpha:0, /*_x:101,*/ ease:animEffect.easeEffect});

	repeatSlides();
	
}

function animerUt2(){
	TweenLite.to(slide2, hastighet, {_x:xPosEnd,_alpha:0, /*_x:101,*/ ease:animEffect.easeEffect});
}



kickOFFtheShit();
resetSlide1();
resetSlide2();
