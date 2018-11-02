component {

	public void function run() {

		//  open share.txt, find the url and set to a variable
		sharecontent = fileRead("share.txt");
		tStart = find("https://",sharecontent);
		tEnd = find(".io",sharecontent);
		ngrokurl = mid(sharecontent, tStart, tEnd-tStart+3);

		//  open .ask/config, get skillID, and then find location of url and replace ngrokurl  
		configcontent = fileRead("/.ask/config");
		tStart = find("https://",configcontent);
		if (tStart GT 0) {
			tEnd = find("/alexa",configcontent);
		}
		else {
			replacenocase(configcontent,"ask-custom-cfalexa-default",ngrokurl);
		}
		replacethis = mid(configcontent, tStart, tEnd-tStart);
		newfile = replacenocase(configcontent,replacethis,ngrokurl);
		fileWrite(expandPath("/.ask/config"), newfile);

		//  open skill.json, find location of url and replace with ngrokurl 
		shareurl = fileRead("skill.json");
		tStart = find("https://",shareurl);
		tEnd = find("/alexa",shareurl);
		replacethis = mid(shareurl, tStart, tEnd-tStart);
		newfile = replacenocase(shareurl,replacethis,ngrokurl);
		fileWrite(expandPath("skill.json"), newfile);
	}

}
