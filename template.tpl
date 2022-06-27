﻿___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Reprise Digital - X-Gtm-Server-Preview",
  "description": "Variable that\u0027s populating the X-Gtm-Server-Preview header value from the GTM preview cookies. It\u0027s to debug manual send HTTP request in the preview_mode. You don\u0027t have to look up the value anymore.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_SERVER___

const getCookieValues = require('getCookieValues');
const toBase64 = require('toBase64');

//Retrieve cookie values
var gtm_preview = getCookieValues('gtm_preview')[0];
var gtm_auth = getCookieValues('gtm_auth')[0];
var gtm_debug = getCookieValues('gtm_debug')[0];

gtm_preview = gtm_preview.substring(12, 50);  //Remove container ID from cookie value
gtm_auth = gtm_auth.substring(12, 50);  //Remove container ID from cookie value
gtm_debug = gtm_debug.substring(12, 50);  //Remove container ID from cookie value

var to_base_64 = gtm_preview+'|'+gtm_auth+'|'+gtm_debug;  //Putting all the cookies together devided by |

const x_gtm_server_preview = toBase64(to_base_64);  //Encode it with base64 to get the X-Gtm-Preview-Header

return x_gtm_server_preview;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "gtm_preview"
              },
              {
                "type": 1,
                "string": "gtm_debug"
              },
              {
                "type": 1,
                "string": "gtm_auth"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(undefined);


___NOTES___

Created on 6/27/2022, 1:53:36 PM


