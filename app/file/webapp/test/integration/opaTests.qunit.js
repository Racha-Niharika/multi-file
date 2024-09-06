sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'file/test/integration/FirstJourney',
		'file/test/integration/pages/HospitalList',
		'file/test/integration/pages/HospitalObjectPage',
		'file/test/integration/pages/FilesObjectPage'
    ],
    function(JourneyRunner, opaJourney, HospitalList, HospitalObjectPage, FilesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('file') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHospitalList: HospitalList,
					onTheHospitalObjectPage: HospitalObjectPage,
					onTheFilesObjectPage: FilesObjectPage
                }
            },
            opaJourney.run
        );
    }
);