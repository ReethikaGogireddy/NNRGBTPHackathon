using { com.select.electronics as db } from '../db/schema';

service Electronics {
    entity BusinessPartner as projection on db.BusinessPartner;
    entity State as projection on db.State;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity StockData as projection on db.StockData;
    entity PurchaseApp as projection on db.PurchaseApp;
    entity SalesApp as projection on db.SalesApp;
    entity Items as projection on db.Items;
}

annotate Electronics.BusinessPartner with @odata.draft.enabled;
annotate Electronics.Store with @odata.draft.enabled;
annotate Electronics.Product with @odata.draft.enabled;
annotate Electronics.StockData with @odata.draft.enabled;
annotate Electronics.PurchaseApp with @odata.draft.enabled;
annotate Electronics.SalesApp @odata.draft.enabled;
annotate Electronics.Items with @odata.draft.enabled;


 


