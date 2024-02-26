namespace com.select.electronics;
using {managed, cuid} from '@sap/cds/common';

entity BusinessPartner:cuid,managed{
@title :'Business Partner Number'
business_partnerno: Integer @Core.Computed;
 @title :'Name'
 name: String(40) @mandatory; 
 @title :'Address 1'
 address1: String(100) @mandatory;
 @title :'Address 2'
 address2: String(100) @mandatory;
 @title :'City'
 city: String(50) @mandatory;
 @title :'State'
 state: Association to State;
 @title :'PIN code'
 pin_code : String(10);
@title :'PanNo'
 pan_no : String(10);
 @title:'is_gstn_registred' 
 is_gstn_registred : Boolean default false;
 @title: 'GSTIN Number'
 gst_no: String(15) @mandatory;
 @title:'is_vendor'
 is_vendor : Boolean default false;
 @title:'is_customer' 
 is_customer: Boolean default false;
}


entity State { 
 @title:'code'
 key code : String(2);
 @title :'Description'
 description : String(25); 
}

entity Store :cuid,managed{
@title: 'Store ID'
store_id: String(7);
 @title :'Name'
 name: String(40) @mandatory; 
 @title :'Address 1'
 address1: String(100) @mandatory;
 @title :'Address 2'
 address2: String(100) @mandatory;
 @title :'City'
 city: String(50) @mandatory;
 @title :'State'
 state: Association to State;
 @title :'PIN code'
 pin_code : String(10);
}

entity Product:cuid,managed{
 @title:'Product ID'
 product_id: String(10);
 @title:'Product Name'
 product_name: String(10);
 @title:'Product Image'
 ImageURL : String(500);
 @title: 'Product Cost Price'
 product_cp: Integer;
 @title: 'Product Sell Price'
 product_sp: Integer;
}

entity StockData:cuid,managed{
    @title:'Stock Id'
    store_id:String(10);
    @title:'Product Id'
    product_id:Association to Product;
    @title:'Stock Quantity'
    stock_qty:Integer;
}

entity PurchaseApp : cuid,managed {
    @title:'Purchase Order Number'
    purchase_orderno:String(10);
    @title:'Business Partner'
    business_partner:Boolean default false;
    @title:'Purchase Order Date'
    purchase_orderdate:String(10);
    @title:'Items'
    Items:Composition of many {
        key ID: UUID;
        item: Association to Items;
    }
}

entity SalesApp:cuid,managed{
    @title:'Sales Order Number'
    sales_orderno:String(10);
    @title:'Business Partner'
    business_partner:String(50);
    @title:'Sales Date'
    sales_orderdate:String(10);
    @title:'Items'
    Items:Composition of many {
        key ID: UUID;
       item:Association to Items;
    }
}

entity Items:cuid,managed{
    @title:'ProductID'
    product_id:Association to Product;
    @title:'Quantity'
    qty:Association to StockData;
    @title:'Price'
    price:Association to Product;
    @title:'Store ID'
    store_id: Association to StockData;
}