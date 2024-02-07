using { com.select.electronics as db } from '../db/schema';

service Electronics {
    entity BusinessPartner as projection on db.BusinessPartner;
}

annotate Electronics.BusinessPartner with @odata.draft.enabled;

