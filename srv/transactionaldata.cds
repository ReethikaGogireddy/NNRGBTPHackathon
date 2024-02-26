using { com.select.electronics as db } from '../db/schema';

using {  Electronics } from './service';

annotate Electronics.StockData with @(
    UI.LineItem:[
        {
            Value: store_id
        },
        {
            Value: product_id.product_id
        },
        {
            Value: stock_qty
        },
        
    ],
     UI.FieldGroup #StockData : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: store_id
        },
        {
            Value: product_id_ID
        },
        {
            Value: store_id
        },
    
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockDataFacet',
            Label : 'StockData',
            Target : '@UI.FieldGroup#StockData',
        },
    ],
);

annotate Electronics.PurchaseApp with @(
    UI.LineItem:[
        {
            Value: purchase_orderno
        },
        {
            Value: business_partner
        },
        {
            Value: purchase_orderdate
        },
        {
            Value:Items.item.product_id
        },
        {
            Value:Items.item.qty
        },
        {
            Value:Items.item.price
        },
        {
            Value:Items.item.store_id
        },
       
    ],
     UI.FieldGroup #PurchaseApp : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: purchase_orderno
        },
        {
            Value: business_partner
        },
        {
            Value: purchase_orderdate
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseAppFacet',
            Label : 'PurchaseApp',
            Target : '@UI.FieldGroup#PurchaseApp',
        },
    ],
);


annotate Electronics.SalesApp with @(
    UI.LineItem:[
        {
            Value: sales_orderno
        },
        {
            Value: business_partner
        },
        {
            Value: sales_orderdate
        },
        
    ],
     UI.FieldGroup #SalesApp : {
        $Type : 'UI.FieldGroupType',
        Data : [
         {
            Value: sales_orderno
        },
        {
            Value: business_partner
        },
        {
            Value: sales_orderdate
        },
       
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesAppFacet',
            Label : 'Sales',
            Target : '@UI.FieldGroup#SalesApp',
        },
    ],
);

annotate Electronics.Items with @(
    UI.LineItem:[
        {
            Value: product_id.product_id
        },
        {
            Value: qty.stock_qty
        },
        {
            Value: price.product_sp
        },
        {
            Value:store_id.store_id
        },
        
    ],
     UI.FieldGroup #Items : {
        $Type : 'UI.FieldGroupType',
        Data : [
         {
            Value: product_id_ID
        },
        {
            Value: qty_ID
        },
        {
            Value: price_ID
        },
        {
            Value:store_id_ID
        }
       
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#Items',
        },
    ],
);












