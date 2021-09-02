*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${baseUrl}                     https://www.google.com/
${os}                          windows
${osVersion}                   10
${browser}                     chrome
${browserVersion}              92.0
${browserstack_userName}       dennythree_04ITlG
${browserstack_accessKey}      c7WzMUEqoj9FEMprKsbT

*** Test Cases ***
testSetupBrowserstack
    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
    &{desiredCapabilities}      Create Dictionary   os=${os}     os_version=${osVersion}     browser=${browser}   browser_version=${browserVersion}
    Open Browser      ${baseUrl}    remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}
    Close Browser