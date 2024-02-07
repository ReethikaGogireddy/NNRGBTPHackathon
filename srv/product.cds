using {  Electronics } from './service';

// annotate Electronics.Product with {
//     @Common.Text : '{Electronics.ProductPictureURL}', // Assuming ProductPictureURL holds the image URL
//     @Core.IsURL : true,
//     @Core.MediaType : 'image/jpg',
//     ProductPictureURL : 'https://www.amazon.in/Round-Cane-Fruit-Basket-Handle/dp/B07DXJWWLH' // Replace with your actual image URL
// };


annotate Electronics.Product with @(
    UI.LineItem:[
        {
            Value: product_id
        },
        {
            Value:product_name
        },
        // { $Type : 'UI.DataField',
        //   Value : ProductPictureURL,
        // ![@UI.Importance] : #High
        // },
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