namespace com.select.electronics;
using {managed, cuid} from '@sap/cds/common';

entity BusinessPartner:cuid,managed{
@title :'Business Partner Number'
business_partnerno: Integer;
 @title :'Name'
 name: String(40) @mandatory; 
 @title :'Address 1'
 address1: String(100) @mandatory;
 @title :'Address 2'
 address2: String(100) @mandatory;
 @title :'City'
 city: String(50) @mandatory;
 @title :'State'
 state: String(40) @mandatory;
 @title :'PIN code'
 pin_code : String(10);
 @title:'is_gstn_registred' 
 is_gstn_registred : Boolean default false;
 @title: 'GSTIN Number'
 gst_no: String(15) @mandatory;
 @title:'is_vendor'
 is_vendor : Boolean default false;
 @title:'is_customer' 
 is_customer: Boolean default false;
}