*** Settings ***
Documentation       Tests for Cart Page
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String
Library    random
Resource    ../variables.robot
Resource    ../Resource/Resource.robot
Test Setup    Login With Valid User
Test Teardown    Close Browser Session

*** Test Cases ***
Verify all the web elements are present on the Cart Page
    Click On Cart Icon
    Verify The Logo
    Verify The Page Title    ${page_title}    ${cart_page_title}
    Verify The Continue Shopping Button Is Present On The Page
    Verify The Checkout Button Is Present On The Page
    Verify The Burger Icon Is Present

Verify user can redirect back on products list page from Cart page
    Click On Cart Icon
    Click On Continue Shopping Button
    Verify The Page Title    ${page_title}    ${product_page_title}

Verify User can add a single item in the Cart
    Click on Random add to cart button
    Click On Cart Icon
    Verify cart item is present on the cart page

Verify user can remove single item
    Remove Item From The Cart From Product List Page
    Click On Cart Icon
    Verify cart item is not present on the cart page

Verify user can add the product in the cart from product details page
    Click on Random product name
    Click on add to cart button from product details page
    Click On Cart Icon
    Verify cart item is present on the cart page

Validate user can remove the product from cart from product details page
    Click on Random product name
    Click on add to cart button from product details page
    Click Remove Button
    Click On Cart Icon
    Verify cart item is not present on the cart page

Validate user can remove product from cart page
    Click on Random product name
    Click on add to cart button from product details page
    Click On Cart Icon
    Verify cart item is present on the cart page
    Click Remove Button
    Verify cart item is not present on the cart page

Validate user can add multiple items in the cart
    Add multiple product items in the cart
    Click On Cart Icon
    Click On Checkout Button
    Fill The Checkout Form
    Click On Continue Button From Check Out Page
    Verify The Page Title    ${page_title}    ${check_out_overview_page_title}
    Verify Checkout Item Is Present On The Checkout Page
    Click On Finish Button
    Verify Order Placed Successfully

Validate user can remove multiple items from the cart
    Remove multiple product items from the cart



