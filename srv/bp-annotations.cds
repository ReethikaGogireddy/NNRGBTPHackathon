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
            Value: state
        },
        {
            Value: pin_code
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
            Value: state
        },
        {
            Value: pin_code
        },
        {
            Value: gst_no
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