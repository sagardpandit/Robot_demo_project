*** Settings ***
Documentation       Tests for Login Page
Library     SeleniumLibrary
Resource   ../Resource/Resource.robot
Resource   ../variables.robot

*** Test Cases ***
Verify user successful login
    [Documentation]    This test case is to Validate successful Login
    Open the Browser with URL
    Fill The Login Form    ${valid_username}    ${valid_password}
    Verify inventory page opens
    Click On Logout
    Close Browser Session

Verify user login with invalid password
    [Documentation]    This test case is to Validate user Login with invalid password
    Login With Invalid User     ${valid_username}    ${invalid_password}    ${error_message}

Verify user login with invalid username
    [Documentation]    This test case is to Validate user Login with invalid username
    Login With Invalid User     ${invalid_username}    ${valid_password}    ${error_message}

Verify user login with invalid username and invalid password
    [Documentation]    This test case is to Validate user Login with invalid username and invalid password
    Login With Invalid User     ${invalid_username}    ${invalid_password}    ${error_message}

Verify user login with lockedout user
    [Documentation]    This test case is to Validate user Login lockedout user
    Login With Invalid User     ${locked_out_user}    ${valid_password}    ${user_locked_out_error_message}

Verify user login with empty username and empty password
    [Documentation]    This test case is to Validate user Login with empty username and empty password
    Login With Invalid User     ${empty_username}    ${empty_password}    ${empty_username_error_message}
