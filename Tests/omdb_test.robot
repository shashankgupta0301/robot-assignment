*** Settings ***

Resource        ${EXECDIR}/Resources/omdb_common.robot
Resource        ${EXECDIR}/Tests/omdb_userdata.robot

Suite Setup     omdb_common.Invoke Session
Suite Teardown  omdb_common.Delete Sessions


*** Test Cases ***
Authentication Search By Movie Title
    [Tags]     GET
    Authenticate Movie Search by Title   ${MvTle}    ${RYr}  ${MPlot}  ${SAKey}

Authentication Search By Movie ID
    [Tags]      GET
    Authenticate Movie Search by Id     ${MvId}   ${MPlot}  ${SAKey}

Verify Response Body
    [Tags]  GET
    Verify Get Response Body    ${MvTle}    ${RYr}  ${MPlot}    ${SAKey}    ${ResVal}   ${RtdVal}   ${RunVal}   ${LangVal}  ${CtyName}  ${SrcVal}   ${MvRate}

Verify Country detail in response
    [Tags]    GET
    Verify Country      ${MvTle}    ${RYr}   ${MPlot}  ${SAKey}      ${CtyName}




