using {miyasuta.media as db} from '../db/schema';

service Attachments{
    entity Files as projection on db.Files;
   
    entity Hospital as projection on db.Hospital;
    
}

annotate Attachments.Hospital with @odata.draft.enabled;
//annotate Attachments.Files with @odata.draft.enabled;


// Annotations for Bus entity
annotate Attachments.Hospital with @(
    UI.LineItem: [
        
        {
            Label: 'hospital_id',
            Value: hospital_id
        },
        {
            Label: 'hospital_name',
            Value: hospital_name
        },
        {
            Label: 'address',
            Value: address
        },
        {
            Label: 'no_of_doctors',
            Value: no_of_doctors
        },
         {
            Label: 'no_of_patients',
            Value: no_of_patients
        }
    ]
);

annotate Attachments.Hospital with @(
    UI.FieldGroup #BusTransport : {
        $Type: 'UI.FieldGroupType',
        Data: [
            
            {
            Label: 'hospital_id',
            Value: hospital_id
        },
        {
            Label: 'hospital_name',
            Value: hospital_name
        },
        {
            Label: 'address',
            Value: address
        },
        {
            Label: 'no_of_doctors',
            Value: no_of_doctors
        },
         {
            Label: 'no_of_patients',
            Value: no_of_patients
        }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'GeneratedFacet1',
            Label: 'General Information',
            Target: '@UI.FieldGroup#BusTransport'
        }
    ]
);

