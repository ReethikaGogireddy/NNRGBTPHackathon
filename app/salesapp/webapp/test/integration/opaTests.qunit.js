sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesapp/test/integration/FirstJourney',
		'salesapp/test/integration/pages/SalesAppList',
		'salesapp/test/integration/pages/SalesAppObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesAppList, SalesAppObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesAppList: SalesAppList,
					onTheSalesAppObjectPage: SalesAppObjectPage
                }
            },
            opaJourney.run
        );
    }
);