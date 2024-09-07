sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'file/test/integration/FirstJourney',
		'file/test/integration/pages/HospitalList',
		'file/test/integration/pages/HospitalObjectPage'
    ],
    function(JourneyRunner, opaJourney, HospitalList, HospitalObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('file') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHospitalList: HospitalList,
					onTheHospitalObjectPage: HospitalObjectPage
                }
            },
            opaJourney.run
        );
    }
);