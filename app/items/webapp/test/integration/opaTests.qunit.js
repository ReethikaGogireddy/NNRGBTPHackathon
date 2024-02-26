sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'items/test/integration/FirstJourney',
		'items/test/integration/pages/ItemsList',
		'items/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ItemsList, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('items') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheItemsList: ItemsList,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);