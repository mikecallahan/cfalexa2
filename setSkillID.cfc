component {

	public void function run() {
		tPath = GetDirectoryFromPath(GetCurrentTemplatePath());
		configcontent = fileRead("#tPath#.ask/config");
		tStart = find("amzn",configcontent);
		tEnd = find("was_cloned",configcontent);
		tSkillID = mid(configcontent, tStart, tEnd-tStart-10);
		vtcontent = fileRead("#tPath#alexaskills/voice_template/voicetemplate.cfc");
		newvoicetemplate = replacenocase(vtcontent,"{put your skill id here}",tSkillID);
		fileWrite("#tPath#alexaskills/voice_template/voicetemplate.cfc", newvoicetemplate);
	}

}
