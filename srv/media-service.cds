using {miyasuta.media as db} from '../db/schema';

service Attachments {
    entity Files as projection on db.Files;
    action DownloadTemplate() returns String;
    action UploadData() returns Boolean;
    action fileUpload(mimeType: String, fileName: String, fileContent: String, fileExtension: String) returns Boolean;
    action downloadFile() returns {
        fileContent: String;
        fileName: String;
        mimeType: String;
        fileExtension: String;
    };
    entity Hospital as projection on db.Hospital
}

annotate Attachments.Hospital with @odata.draft.enabled;
//annotate Transport.Files with @odata.draft.enabled;


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
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'relatedFilesFacet',
            Label: 'Related Files',
            Target: 'Files/@UI.LineItem',
            
        }
    ]
);




annotate Attachments.Files with @(
    UI.LineItem: [
        {
            Label: 'Product ID',
            Value: fid_ID

        },
        {
            $Type: 'UI.DataField',
            Value: fileName,
            Label: 'File Name'
        },
        {
            $Type: 'UI.DataField',
            Value: mediaType,
            Label: 'Media Type'
        },
        {
            $Type: 'UI.DataField',
            Value: size,
            Label: 'File Size'
        },
        {
            $Type: 'UI.DataField',
            Value: url,
            Label: 'URL'
        }
    ],
    UI.FieldGroup #FileDetails: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
            Label: 'Files ID',
            Value: fid_ID
        },
            {
                $Type: 'UI.DataField',
                Value: fileName,
                Label: 'File Name'
            },
            {
                $Type: 'UI.DataField',
                Value: mediaType,
                Label: 'Media Type'
            },
            {
                $Type: 'UI.DataField',
                Value: size,
                Label: 'File Size'
            },
            {
                $Type: 'UI.DataField',
                Value: url,
                Label: 'URL'
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'relatedFilesFacet',
            Label: 'Related Files',
            Target: '@UI.FieldGroup#FileDetails',
            
        }
    ]
);