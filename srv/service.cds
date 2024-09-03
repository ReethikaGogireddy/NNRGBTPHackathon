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


 annotate Electronics.BusinessPartner with {
 pin_code      @assert.format: '^[1-9][0-9]{5}$';
    
}


annotate Electronics.Store with {
 pin_code      @assert.format: '^[1-9][0-9]{5}$';
    
}
annotate Electronics.BusinessPartner with @(
    UI.LineItem:[
        {
            Value: business_partnerno
        },
        {
            Value: name
        },
        {
            Value: address1
        },
        {
            Value: address2
        },
        {
            Value: city
        },
        {
            Value: state.description
        },
        {
            Value: pin_code
        },
        {
            Value: pan_no
        },
        {
            Value: is_gstn_registered
        },
        {
            Value: gst_no
        },
        {
            Value: is_vendor
        },
        {
            Value: is_customer
        },
    ],
     UI.FieldGroup #BusinessPartner : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: name
        },
        {
            Value: address1
        },
        {
            Value: address2
        },
        {
            Value: city
        },
        {
            Value: state_code
        },
        {
            Value: pin_code
        },
        {
            Value: pan_no
        },
        {
            Value: gst_no
        },
        {
            Value: is_gstn_registered
        },
        {
            Value: is_vendor
        },
        {
            Value: is_customer
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerFacet',
            Label : 'BusinessPartner',
            Target : '@UI.FieldGroup#BusinessPartner',
        },
    ],

);

annotate Electronics.State with @(
UI.LineItem: [
        {
            @Type : 'UI.DataField',
            Value : code
        },
        {
            @Type : 'UI.DataField',
            Value : description
        },
],
);


annotate Electronics.BusinessPartner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
}



annotate Electronics.Product with @(
    UI.LineItem:[
        {
            Value: product_id
        },
        {
            Value:product_name
        },
        {   $Type : 'UI.DataField',
            Value : ImageURL,
           ![@UI.Importance] : #High
        },
        {
            Value: product_cp
        },
        {
            Value: product_sp
        },
        
    ],
     UI.FieldGroup #Product : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Value: product_id
        },
        {
            Value:product_name
        },
        {
            Value : ImageURL,
        },
        {
            Value: product_cp
        },
        {
            Value: product_sp
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductFacet',
            Label : 'Product',
            Target : '@UI.FieldGroup#Product',
        },
    ],
);

annotate Electronics.Product with {
@Common.Text : ' {Product}'
@Core.IsURL: true
@Core.MediaType: 'image/jpg'
ImageURL;
};


annotate Electronics.Store with @(
    UI.LineItem:[
        {
            Value: store_id
        },
        {
            Value: name
        },
        {
            Value: address1
        },
        {
            Value: address2
        },
        {
            Value: city
        },
        {
            Value: state.description
        },
        {
            Value: pin_code
        },
    ],
     UI.FieldGroup #Store : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Value: store_id
        },
        {
            Value: name
        },
        {
            Value: address1
        },
        {
            Value: address2
        },
        {
            Value: city
        },
        {
            Value: state_code
        },
        {
            Value: pin_code
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreFacet',
            Label : 'Store',
            Target : '@UI.FieldGroup#Store',
        },
    ],

);

// annotate Electronics.State with @(
// UI.LineItem: [
//         {
//             @Type : 'UI.DataField',
//             Value : code
//         },
//         {
//             @Type : 'UI.DataField',
//             Value : description
//         },
// ],
// );


annotate Electronics.Store with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
}


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