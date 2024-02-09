*** Settings ***
Library             FakeLibrary.py
Library             FakeLibrary.py    AS    Second

Suite Setup         Second.Connect To Radio    192.168.200.1    username    password
Suite Teardown      Second.Disconnect From Radio


*** Test Cases ***
Test Libraries
    ${first}    Get Library Instance    FakeLibrary
    ${second}    Get Library Instance    Second
    Log    ${first}    console=${True}
    Log    ${first}    console=${True}
    Should Not Be Equal    ${first}    ${second}

Test Connections
    ${connection_first}    FakeLibrary.Get Connection
    ${connection_second}    Second.Get Connection
    Log    ${connection_first}    console=${True}
    Log    ${connection_second}    console=${True}

    Should Not Be Equal    ${connection_first}    ${connection_second}
