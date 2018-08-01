*** Settings ***
Documentation    Suite description
Library    RequestsLibrary
Library    Collections
Library     BuiltIn
Library     OperatingSystem
Library     String

Resource        ${EXECDIR}/Tests/crud_userdata.robot

*** Keywords ***
### Keyword to create session
Invoke Session
    Log     I am setting up the session
    Create Session  crudapi     ${BaseURL}


## Keyword to destroy all sessions
Delete Sessions
    Log     I am destroying all the sessions
    delete all sessions


### Authenticating GET Request
Authenticate Get
    [Arguments]     ${emplist}
    ${resp}=    Get Request  crudapi  ${emplist}
    should be equal as strings  ${resp.status_code}     ${200}
    [Return]  ${resp}


### Get List of All Employees
Get Employee List
    [Arguments]     ${resourcelist}
    ${response}=    Authenticate Get    ${resourcelist}
    log    ${response.json()}


### Verify details of Specific Employee(firstname, lastname, email, department)
Verify Emp Exists
    [Arguments]     ${resr_empid}   ${fname}    ${lname}    ${emailid}  ${deptname}
    ${response}=    Authenticate Get    ${resr_empid}
    log     ${response.json()}

    ${fname_element}=    Get From Dictionary       ${response.json()}    first_name
    #log  ${fname_element}
    Should Be Equal As Strings    ${fname_element}    ${fname}

    ${lname_element}=    Get From Dictionary       ${response.json()}    last_name
    #log  ${lname_element}
    Should Be Equal As Strings    ${lname_element}    ${lname}

    ${email_element}=    Get From Dictionary       ${response.json()}    email
    #log  ${email_element}
    Should Be Equal As Strings    ${email_element}    ${emailid}

    ${dept_element}=    Get From Dictionary       ${response.json()}    department
    #log  ${dept_element}
    Should Be Equal As Strings    ${dept_element}    ${deptname}



### Update Emp Email (Example: Will update emp with ID=5)
Update Emp Details
    [Arguments]     ${updResource}  ${updFname}
    ${emailPart1}=      Generate Random String	12	[LOWER]
    ${emailPart2}=    Set Variable   @gmail.com
    ${emailRandom}=    Set Variable   ${emailPart1}${emailPart2}
    &{data}=    Create Dictionary    first_name=${updFname}     email=${emailRandom}
    &{headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    Put Request    crudapi    ${updResource}    data=&{data}    headers=&{headers}
    log  ${response.json()}
    should be equal as strings    ${response.status_code}     ${200}
    ${email_element}=    Get From Dictionary       ${response.json()}   email
    ## Verify that Email got updated
    log  ${email_element}
    should be equal as strings      ${email_element}    ${emailRandom}


### Create a New Employee in System
Create Emp
    [Arguments]     ${addResource}  ${addFname}     ${addLname}     ${addDept}
    ${emailPart1}=      Generate Random String	12	[LOWER]
    ${emailPart2}=    Set Variable   @gmail.com
    ${emailRandom}=    Set Variable   ${emailPart1}${emailPart2}
    &{data}=    Create Dictionary    first_name=${addFname}    last_name=${addLname}    email=${emailRandom}    department=${addDept}
    &{headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    crudapi    ${addResource}    data=&{data}    headers=&{headers}
    should be equal as strings    ${resp.status_code}     ${201}
    log  ${resp.json()}
    ## Verifying the First Name for new Record
    ${fname_element}=    Get From Dictionary       ${resp.json()}   first_name
    log  ${fname_element}
    should be equal as strings      ${fname_element}    ${addFname}


### Delete a New Employee
Delete Emp Details
    [Arguments]  ${delResource}
    ${resp}=    Delete Request  crudapi     ${delResource}
    should be equal as strings    ${resp.status_code}     ${204}

### Delete Dynamically a New Employee
Delete Details Dynamically
    [Arguments]     ${addResource}  ${addFname}     ${addLname}     ${addDept}
    ${emailPart1}=      Generate Random String	12	[LOWER]
    ${emailPart2}=    Set Variable   @gmail.com
    ${emailRandom}=    Set Variable   ${emailPart1}${emailPart2}
    &{data}=    Create Dictionary    first_name=${addFname}    last_name=${addLname}    email=${emailRandom}    department=${addDept}
    &{headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    crudapi    ${addResource}    data=&{data}    headers=&{headers}
    should be equal as strings    ${resp.status_code}     ${201}
    log  ${resp.json()}
    ## Verifying the First Name for new Record
    ${id_element}=    Get From Dictionary       ${resp.json()}   id
    log     ${id_element}

    ${del1}=        Set Variable     /apis/emp_list/
    ${del2}=        Set Variable     /delete/
    ${deleteRsrc}=     Set Variable     ${del1}${id_element}${del2}
    log         ${deleteRsrc}
    ${response}=    Delete Request  crudapi     ${deleteRsrc}
    should be equal as strings    ${response.status_code}     ${204}
