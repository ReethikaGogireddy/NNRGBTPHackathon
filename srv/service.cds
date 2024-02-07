using { com.select.electronics as db } from '../db/schema';

service Electronics {
    entity BusinessPartner as projection on db.BusinessPartner;
    entity State as projection on db.State;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
}

annotate Electronics.BusinessPartner with @odata.draft.enabled;
annotate Electronics.Store with @odata.draft.enabled;
annotate Electronics.Product with @odata.draft.enabled;


 


