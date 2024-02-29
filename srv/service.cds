using { com.select.electronics as db } from '../db/schema';

service Electronics {
    entity BusinessPartner as projection on db.BusinessPartner;
    entity State as projection on db.State;
    entity Store as projection on db.Store{
        @UI.Hidden: true
        ID,
        *
    };
    entity Product as projection on db.Product{
        @UI.Hidden: true
        ID,
        *
    };
    entity StockData as projection on db.StockData{
        @UI.Hidden: true
        ID,
        *
    };
    entity PurchaseApp as projection on db.PurchaseApp{
        @UI.Hidden: true
        ID,
        *
    };
    entity SalesApp as projection on db.SalesApp;
    // entity Items as projection on db.Items{
    //     @UI.Hidden: true
    //     ID,
    //     *
    // };
}

annotate Electronics.BusinessPartner with @odata.draft.enabled;
annotate Electronics.Store with @odata.draft.enabled;
annotate Electronics.Product with @odata.draft.enabled;
annotate Electronics.StockData with @odata.draft.enabled;
annotate Electronics.PurchaseApp with @odata.draft.enabled;
annotate Electronics.SalesApp @odata.draft.enabled;
// annotate Electronics.Items @odata.draft.enabled;



 


