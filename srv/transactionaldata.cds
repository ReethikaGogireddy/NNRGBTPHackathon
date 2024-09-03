using { com.select.electronics as db } from '../db/schema';

using {  Electronics } from './service';

annotate Electronics.StockData with @(
    UI.LineItem:[
        {
            Value: store_id_ID
        },
        {
            Value: product_id_ID
        },
        {
            Value: stock_qty
        },
        
    ],
     UI.FieldGroup #StockData : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: store_id_ID
        },
        {
            Value: product_id_ID
        },
        {
            Value: stock_qty
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


annotate Electronics.StockData  with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                },
            ]
        }
    )
};

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
            Value:is_vendor
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
            Value:is_vendor
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
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseAppItemsFacet',
            Label : 'PurchaseApp  Items',
            Target :'Items/@UI.LineItem',
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
            Value:is_customer
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
            Value:is_customer
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
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseAppItemsFacet',
            Label : 'PurchaseApp  Items',
            Target :'Items/@UI.LineItem',
        },
    ],
);

// annotate Electronics.Items with @(
//     UI.LineItem:[
//         {
//             Value: product_id.product_id
//         },
//         {
//             Value: qty.stock_qty
//         },
//         {
//             Value: price.product_sp
//         },
//         {
//             Value:store_id.store_id
//         },
        
//     ],
//      UI.FieldGroup #Items : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//         {
//             Value: product_id_ID
//         },
//         {
//             Value: qty_ID
//         },
//         {
//             Value: price_ID
//         },
//         {
//             Value:store_id_ID
//         }
       
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'ItemsFacet',
//             Label : 'Items',
//             Target : '@UI.FieldGroup#Items',
//         },
//     ],
// );


annotate Electronics.PurchaseApp.Items with @(
    UI.LineItem:[
        {
            Label:'Items',
            Value: product_id_ID
        },
        // {
        //     Value: qty
        // },
        // {
        //     Value: price
        // },
        // {
        //     Value: store_id_ID
        // },
    ],
    UI.FieldGroup #PurchaseAppItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: product_id_ID
        },
        {
            Value: qty
        },
        {
            Value: price
        },
        {
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseAppItems',
            Label : 'Sales Items',
            Target : '@UI.FieldGroup#PurchaseAppItems',
        },
      
    ],
);

annotate Electronics.PurchaseApp.Items with {
    store_id@(
        Common.Text:store_id.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store Id',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id@(
        Common.Text:product_id.product_name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_sp'
                }
            ]
        }
    );
   
    
}


annotate Electronics.SalesApp.Items with @(
    UI.LineItem:[
        {
            Label:'Items',
            Value: product_id_ID
        },
        // {
        //     Value: qty
        // },
        // {
        //     Value: price
        // },
        // {
        //     Value: store_id_ID
        // },
    ],
    UI.FieldGroup #SalesAppItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
        {
            Value: product_id_ID
        },
        {
            Value: qty
        },
        {
            Value: price
        },
        {
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesAppItems',
            Label : ' Sales Items',
            Target : '@UI.FieldGroup#SalesAppItems',
        },
      
    ],
);

annotate Electronics.SalesApp.Items with {
    store_id@(
        Common.Text:store_id.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store Id',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id@(
        Common.Text:product_id.product_name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_sp'
                }
            ]
        }
    );
   
    
}
















