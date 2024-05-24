*** Settings ***
Resource    ../variables.robot

*** Variables ***
#       Login Page
${username_text}        //*[@id="user-name"]
${password_text}        //*[@id="password"]
${login_button}    //*[@id="login-button"]
${login_error_message}    css:h3
${logout_button}        //*[@id="logout_sidebar_link"]

#       Inventory Page
${inventory_url}   https://www.saucedemo.com/inventory.html
${page_title}    css:.title
${item_count}    //div[@id='inventory_container']/div/div/div[2]
${burger_button}    //*[@id="react-burger-menu-btn"]
${cart_icon}    //div[@id='shopping_cart_container']/a
${logo}    //div[@id='header_container']/div/div[2]/div
${social_media_icon_twitter}    //a[normalize-space()='Twitter']
${social_media_icon_facebook}    //a[contains(text(),'Facebook')]
${social_media_icon_linkdin}    //a[contains(text(),'LinkedIn')]
${product_list}    //div[contains(@class,'inventory_item_name')]

#       Product Details Page
${bact_to_products_button}    //button[@id='back-to-products']
${add_to_cart_button}    //button[contains(.,'Add to cart')]
${remove_button}    //button[contains(.,'Remove')]


#       Cart Page
${continue_shopping_button}    //button[@id='continue-shopping']
${checkout_button}    //button[@id='checkout']
${cart_item}    //div[@id='cart_contents_container']/div/div/div[3]

#       Checkout Page
${check_out_form}    //div[@id='checkout_info_container']/div/form/div
${cancel_button}    //button[@id='cancel']
${continue_button}    //input[@id='continue']
${first_name}    //input[@id='first-name']
${last_name}    //input[@id='last-name']
${zipcode}    //input[@id='postal-code']

#       Checkout Overview
${check_out_item}    //div[@id='checkout_summary_container']/div/div/div[3]
${finish_button}    //button[@id='finish']

#       Checkout Complete
${thanks_msg}    //h2[contains(.,'Thank you for your order!')]
${back_home_button}    //button[@id='back-to-products']
