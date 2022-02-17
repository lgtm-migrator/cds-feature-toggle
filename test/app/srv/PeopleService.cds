namespace test.app.people;

using {
  Country,
  managed,
  cuid
} from '@sap/cds/common';


type FreeActionResponse {

  service : String;
  name    : String;

}

@cds.features.required : 'people-service'
@impl                  : './impl/PeopleService.js'
service PeopleService {

  entity Peoples : cuid {
    Name : String(255)
  } actions {

      @cds.features.required : 'feat-update-people-name'
      action UpdateName(newName :  String(255)) returns String(255);

      @cds.features.required : 'feat-get-people-name'
      function GetName() returns String(255);

    };


  action freeAction(name : String) returns FreeActionResponse;

  @cds.features.required : [
    'feat-free-action-v2',
    'all-features'
  ]
  action freeActionV2(name : String) returns FreeActionResponse;

}
