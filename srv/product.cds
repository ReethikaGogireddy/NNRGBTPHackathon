using {  Electronics } from './service';
annotate Electronics.Product with @(
    UI.LineItem:[
        {
            Value: product_id
        },
        {
            Value:product_name
        },
        {   $Type : 'UI.DataField',
            Value : 'ImageURL',
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
            Value : 'ImageURL',
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
  @Common.Text : '{Product}'
  @Core.IsURL : true
  @Core.MediaType : 'image/jpg'
  ImageURL
};