*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../PageObject/Pages.robot
Resource    ../variables.robot

*** Keywords ***

Open the Browser with URL
    Create Webdriver    ${browser_name}  ../Drivers/chromedriver
    Go To   ${base_url}
    Maximize Browser Window

Close Browser Session
    Close Browser

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text     ${username_text}       ${username}
    Input Text     ${password_text}       ${password}
    Click Button    ${login_button}

Login with valid user
    Open the Browser with URL
    Fill the login form    ${valid_username}    ${valid_password}

Login with invalid user
    [Arguments]    ${username}    ${password}    ${error_message}
    Open the Browser with URL
    Fill the login form    ${username}    ${password}
    ${expected_error_message}    Get Text     ${login_error_message}
    Should Be Equal As Strings    ${expected_error_message}    ${error_message}
    Close Browser Session

Click on logout
    Click Element    ${burger_button}
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}

Verify inventory page opens
    Wait Until Location Contains    ${inventory_url}

Verify the page title
    [Arguments]    ${page_title}    ${expected_page_title}
    ${actual_page_title}    Get Text     ${page_title}
    Should Be Equal As Strings    ${actual_page_title}    ${expected_page_title}

Verify Product count on products page
     ${product_count}    Get Element Count    ${item_count}
     Should Be Equal As Numbers    ${product_count}    ${total_products}

Verify the logo
    Element Should Be Visible    ${logo}

Verify the cart icon is present
    Element Should Be Visible    ${cart_icon}

Click on Cart icon
    Click Element    ${cart_icon}

Verify the burger icon is present
    Element Should Be Visible    ${burger_button}

Verify the back to products button is present on the page
    Element Should Be Visible    ${bact_to_products_button}

Verify the add to cart button is present on the page
    Element Should Be Visible    ${add_to_cart_button}

Click on product name
    [Arguments]    ${product_name}
    Click Element    ${product_name}

Click on back to products button
    Click Element    ${bact_to_products_button}

Verify link is opening in the second tab
    [Arguments]    ${icon}    ${link}
    Click Element    ${icon}
    ${handles}    Get Window Handles
    Switch Window    ${handles}[1]
    Location Should Contain    ${link}

Verify the checkout button is present on the page
    Element Should Be Visible    ${checkout_button}

Verify the continue shopping button is present on the page
    Element Should Be Visible    ${continue_shopping_button}

Click on continue shopping button
    Click Element    ${continue_shopping_button}

Click on Random product name
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${item}   Set Variable     //div[text()='${random_value}']
    Click Element    ${item}
    RETURN    ${item}

Click on Random add to cart button
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${xpath_name}    Get From Dictionary    ${product_name}    ${random_value}
    ${item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
    Click Element    ${item}

Verify cart item is present on the cart page
    Element Should Be Visible    ${cart_item}

Remove item from the cart from product list page
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${xpath_name}    Get From Dictionary    ${product_name}    ${random_value}
    ${add_item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
    Click Element    ${add_item}
    ${remove_item}        Set Variable     //button[@id='remove-${xpath_name}']
    Click Element    ${remove_item}

Verify cart item is not present on the cart page
    Element Should Not Be Visible    ${cart_item}

Verify Cancel button is present on checkout page
    Element Should Be Visible    ${cancel_button}

Verify continue button is present on checkout page
    Element Should Be Visible    ${continue_button}

Verify checkout info form is present on checkout page
    Element Should Be Visible    ${check_out_form}

Click on checkout button
    Click Element    ${checkout_button}

Click on cancel button from checkout page
    Click Element    ${cancel_button}

Fill the checkout form
    Input Text    ${first_name}    ${first_name_checkout_page}
    Input Text    ${last_name}    ${last_name_checkout_page}
    Input Text    ${zipcode}    ${zipcode_checkout_page}

Click on continue button from check out page
    Click Element    ${continue_button}

Verify checkout item is present on the checkout page
    Element Should Be Visible    ${check_out_item}

Click on Finish button
    Click Element    ${finish_button}

Verify order placed successfully
    ${actual_message}    Get Text    ${thanks_msg}
    Should Be Equal As Strings    ${actual_message}    ${order_success_message}

Click on back to home button
    Click Element    ${back_home_button}

Click on add to cart button from product details page
    Click Element    ${add_to_cart_button}

Click Remove button
    Click Element    ${remove_button}


Get all product list
    ${total_products}    Get Element Count    ${product_list}
    ${item_list}    Create List
    ${temp_list}    Create List
    FOR    ${counter}    IN RANGE    1    ${total_products}+1
        ${item}    Get Text     (${product_list})[${counter}]
        Append To List    ${item_list}    ${item}
    END
    @{temp_list}    Copy List    ${item_list}
    Log    ${temp_list}
    Log    ${item_list}

Add multiple product items in the cart
    ${total_products}    Get Element Count    ${product_list}
    ${item_list}    Create List
    FOR    ${counter}    IN RANGE    1    ${total_products}+1
        ${item}    Get Text     (${product_list})[${counter}]
        Append To List    ${item_list}    ${item}
    END
    ${random_number}    Evaluate    random.randint(1, ${total_products})
    ${random_values}    Evaluate    random.sample(${item_list}, ${random_number})
    FOR    ${index}    IN RANGE    0    ${random_number}
        FOR    ${item}    IN    ${random_values}
           ${product}    Get From List    ${item}    ${index}
           ${xpath_name}    Get From Dictionary    ${product_name}    ${product}
           ${add_item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
           Click Element    ${add_item}
        END
    END
    RETURN    ${random_values}

Remove multiple product items from the cart
    Add multiple product items in the cart
    Click On Cart Icon
    ${remove_buttons}    Get Element Count    ${remove_button}
    ${web_elements}    Get Webelements    ${remove_button}
     FOR    ${index}    IN RANGE    0    ${remove_buttons}
        FOR    ${item}    IN    ${web_elements}
           ${product}    Get From List    ${item}    ${index}
           Click Element    ${remove_button}
        END
    END

