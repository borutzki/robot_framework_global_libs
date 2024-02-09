*** Settings ***
Library             FakeLibrary.py

Suite Setup         Connect To Radio    192.168.100.1    user    password
Suite Teardown      Disconnect From Radio
