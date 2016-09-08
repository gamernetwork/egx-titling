var tl = new TimelineLite();

function Producer(timeline) {
	this.tl = timeline;
}

Producer.prototype.sync = function(time) {
	//console.log(time);
	this.tl.progress(time);
}

function onLoad() {

	//handleFontSize();
	
	// Populate
	if( typeof webvfx !== "undefined" ) {
		// read parameters supplied by webvfx and update template values
		$('#sessionName').text(webvfx.getStringParameter("name"));
		$('#sessionInfo').text(webvfx.getStringParameter("info"));
		$('#now').text(webvfx.getStringParameter("title"));
	}

	doAnimation();

	// Init
	if( typeof webvfx !== "undefined" ) {
		tl.pause(); // start paused
		var producer = new Producer(tl);
		webvfx.renderRequested.connect(producer, Producer.prototype.sync);
		webvfx.readyRender(true);
	}
}

function handleFontSize() {
	// Set base font size to 2.4% of window height (as recommended by OFCOM)
	// All other font sizes to be calculated as multiple in the set (1, inf)
	document.body.style.fontSize = Math.round( window.innerHeight * 0.024 ) + "px";
}

window.addEventListener("load", onLoad, false);
