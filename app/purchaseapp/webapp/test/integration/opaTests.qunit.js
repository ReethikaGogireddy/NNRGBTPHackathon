sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchaseapp/test/integration/FirstJourney',
		'purchaseapp/test/integration/pages/PurchaseAppList',
		'purchaseapp/test/integration/pages/PurchaseAppObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseAppList, PurchaseAppObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchaseapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseAppList: PurchaseAppList,
					onThePurchaseAppObjectPage: PurchaseAppObjectPage
                }
            },
            opaJourney.run
        );
    }
);