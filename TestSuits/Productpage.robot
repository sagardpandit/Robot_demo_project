*** Settings ***
Documentation       Tests for Product Page
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String
Resource    ../variables.robot
Resource    ../Resource/Resource.robot
Test Setup    Login With Valid User
Test Teardown    Close Browser Session

*** Test Cases ***
Verify product page is loading successfully and containing all web elements
    Verify The Logo
    Verify The Page Title   ${page_title}    ${product_page_title}
    Verify Product Count On Products Page
    Verify The Cart Icon Is Present
    Verify The Burger Icon Is Present

Verify product details is loading successfully and containing all web elements
    ${product_name}    Click on Random product name
    Verify The Logo
    Verify The Back To Products Button Is Present On The Page
    Verify The Cart Icon Is Present
    Verify The Add To Cart Button Is Present On The Page

Verify user can navigate back to product list page from product details page.
    Click on Random product name
    Click On Back To Products Button
    Verify The Page Title    ${page_title}    ${product_page_title}

Verify the Social media link facebook is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_facebook}    ${social_media_link_facebook}

Verify the Social media link twitter is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_twitter}    ${social_media_link_twitter}

Verify the Social media link linkdin is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_linkdin}    ${social_media_link_linkdin}




