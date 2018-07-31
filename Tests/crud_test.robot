*** Settings ***
Documentation    Suite description
Resource        ${EXECDIR}/Resources/crud_common.robot
Resource        ${EXECDIR}/Tests/crud_userdata.robot

Suite Setup     crud_common.Invoke Session
Suite Teardown  crud_common.Delete Sessions


*** Test Cases ***
Get All Employees List Information      ##List of All Employees##
    Get Employee List   ${getEmpList}

Get Employee Information    ##Verify Emp Exists##
    Verify Emp Exists     ${getEmpwithID}     ${f_name}   ${l_name}   ${email_id}     ${dept_id}

Update Employee Information     ##Update Emp Details##
    Update Emp Details      ${upd_resource}     ${upd_Fname}

Register/Add New Employee  ##Add a new employee###
    Create Emp      ${add_resource}     ${add_Fname}    ${add_Lname}    ${add_Dept}

Delete Emp Information  ### Delete emp##
    Delete Emp Details  ${del_Resource}
