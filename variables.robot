*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${base_url}      https://www.saucedemo.com/
${browser_name}      Chrome

${valid_username}     standard_user
${valid_password}       secret_sauce
${empty_username}
${empty_password}
${invalid_username}     invalidUserName
${invalid_password}     invalidPassword
${locked_out_user}    locked_out_user

${empty_username_error_message}    Epic sadface: Username is required
${error_message}    Epic sadface: Username and password do not match any user in this service
${user_locked_out_error_message}    Epic sadface: Sorry, this user has been locked out.

${total_products}    6
${product_page_title}    Products
${cart_page_title}    Your Cart
&{product_name}    Sauce Labs Backpack=sauce-labs-backpack    Sauce Labs Bike Light=sauce-labs-bike-light    Sauce Labs Bolt T-Shirt=sauce-labs-bolt-t-shirt    Sauce Labs Fleece Jacket=sauce-labs-fleece-jacket    Sauce Labs Onesie=sauce-labs-onesie    Test.allTheThings() T-Shirt (Red)=test.allthethings()-t-shirt-(red)
${checkout_page_title}        Checkout: Your Information
${check_out_overview_page_title}    Checkout: Overview

${social_media_link_facebook}    https://www.facebook.com/saucelabs
${social_media_link_linkdin}    https://www.linkedin.com/company/sauce-labs/
${social_media_link_twitter}    https://x.com/saucelabs

${first_name_checkout_page}    Sagar
${last_name_checkout_page}    Pandit
${zipcode_checkout_page}    416101

${order_success_message}    Thank you for your order!