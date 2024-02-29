using {  Electronics } from './service';


annotate Electronics.Store with {
 pin_code      @assert.format: '^[1-9][0-9]{5}$';
    
}


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