
//Called when application is started.
function OnStart()
{
	//Create a layout with objects vertically centered.
	var layoutMain = app.CreateLayout( "linear", "VCenter,FillXY" );	

	//Create a text label and add it to layout.
	var txt = app.CreateText( "Hello", -1, -1, "Multiline" );
//	txt.SetTextSize( 32 );
	layoutMain.AddChild( txt );
	
	//Add layout to app.	
	app.AddLayout( layoutMain );
	var docjs = new DocJs();
	docjs.read();
	txt.SetText(docjs.file_text);
	
	var txt2 = app.CreateText( docjs.file.length + " lines to parse." );
	layoutMain.AddChild(txt2);
}

/** This is a description of the DocJs() function. */
function DocJs() {
	var filename = "docJs.js";
	this.file_text = "";
	this.file = [];
	
	this.read = function () {
		this.file_text = app.ReadFile(filename);
		this.file = this.file_text.split("\n");
	};
	
	/* 
	parsing... while not at end of file...
	  if encounter "/*" then start comment
	  if encounter "* /" then end comment
	*/
}
