*** Settings ***
Documentation    Suite description
Library    RequestsLibrary
Library    Collections
Library     BuiltIn
Library     OperatingSystem
Resource        ${EXECDIR}/Tests/omdb_userdata.robot

*** Keywords ***
Invoke Session
    Log     I am setting up the session
    Create Session  omdbapi     ${BaseURI}

Delete Sessions
    Log     I am destroying all the sessions
    delete all sessions

Authenticate Movie Search by Title
    [Arguments]     ${title}    ${year}     ${plot}    ${apiKey}
    ${resp}=    Get Request  omdbapi  ?t=${title}&y=${year}&plot=${plot}&apikey=${apiKey}
    Should Be Equal     ${resp.status_code}     ${200}
    [Return]    ${resp}

Authenticate Movie Search by Id
    [Arguments]     ${id}     ${plot}     ${apiKey}
    ${resp}=    Get Request  omdbapi  ?i=${id}&plot=${plot}&apikey=${apiKey}
    Should Be Equal     ${resp.status_code}     ${200}

Verify Country
    [Arguments]     ${title}    ${year}     ${plot}    ${apiKey}    ${expected_country}
    ${response}=    Authenticate Movie Search by Title      ${title}    ${year}     ${plot}    ${apiKey}
    # Get and assert element 'Country' from the JSON dictionary
    ${country_element}=    Get From Dictionary       ${response.json()}    Country
    Should Be Equal As Strings    ${country_element}    ${expected_country}


Verify Get Response Body
    [Arguments]     ${mtitle}   ${myear}    ${mplot}    ${mapiKey}  ${resp}  ${rated}    ${runtime}      ${lang}     ${cntry}    ${source}   ${value}
    ${response}=    Authenticate Movie Search by Title      ${mtitle}    ${myear}     ${mplot}    ${mapiKey}

    ${response_element}=    Get From Dictionary       ${response.json()}    Response
    Should Be Equal As Strings    ${response_element}    ${resp}
    # Get and assert element 'Title' from the JSON dictionary
    ${title_element}=    Get From Dictionary       ${response.json()}    Title
    Should Be Equal As Strings    ${title_element}    ${mtitle}
    # Get and assert element 'Rated' from the JSON dictionary
    ${rated_element}=    Get From Dictionary       ${response.json()}    Rated
    Should Be Equal As Strings    ${rated_element}    ${rated}
    # Get and assert element 'RunTime' from the JSON dictionary
    ${runtime_element}=    Get From Dictionary       ${response.json()}    Runtime
    Should Be Equal As Strings    ${runtime_element}    ${runtime}
    # Get and assert element 'Language' from the JSON dictionary
    ${language_element}=    Get From Dictionary       ${response.json()}    Language
    Should Be Equal As Strings    ${language_element}    ${lang}
    # Get and assert element 'Country' from the JSON dictionary
    ${country_element}=    Get From Dictionary       ${response.json()}    Country
    Should Be Equal As Strings    ${country_element}    ${cntry}
    # Get and assert element 'Ratings' - 'Index 0 Source and Value' from the JSON dictionary
    ${ratings_element}=    Get From Dictionary       ${response.json()}    Ratings
    Should Be Equal As Strings    ${ratings_element[0]['Source']}    ${source}
    Should Be Equal As Strings    ${ratings_element[0]['Value']}    ${value}