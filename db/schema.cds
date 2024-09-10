namespace miyasuta.media;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Files : cuid, managed {
 
   
    @Core.MediaType: mediaType
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: Integer;
    url: String;

    // Association to Bus entity
    
}
entity Hospital : cuid, managed{

    @title: 'HospitalID'
    hospital_id: String(5);
    @title: 'Hospital Name'
    hospital_name: String(20) ;
    @title: 'Address'
    address: String(20);
    @title: 'no of doctors'
    no_of_doctors: Integer;
    @title: 'no of patients'
    no_of_patients: Integer ;
    
}
