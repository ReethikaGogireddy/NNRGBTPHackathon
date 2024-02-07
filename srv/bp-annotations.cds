using {  Electronics } from './service';


annotate Electronics.BusinessPartner with {
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
            Value: is_gstn_registred
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
            Value: is_gstn_registred
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