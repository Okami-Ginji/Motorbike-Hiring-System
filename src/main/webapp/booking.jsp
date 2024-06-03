<%-- 
    Document   : status
    Created on : May 25, 2024, 4:59:58 PM
    Author     : DiepTCNN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="colorlib.com">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

        <!-- Main css -->
        <style>
            /* @extend display-flex; */
            display-flex,
            .form-flex,
            .form-date-group,
            .form-radio-group,
            .steps ul,
            .title,
            .title .step-number,
            .actions ul li a,
            .form-radio-flex,
            .form-find {
                display: flex;
                display: -webkit-flex;
            }

            /* @extend list-type-ulli; */
            list-type-ulli,
            .steps ul,
            .actions ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            /* roboto-slab-300 - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 300;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-300.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Light"), local("RobotoSlab-Light"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-300.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            /* roboto-slab-regular - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 400;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Regular"), local("RobotoSlab-Regular"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-regular.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            /* roboto-slab-700 - latin */
            @font-face {
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 700;
                src: url("../fonts/roboto-slab/roboto-slab-v7-latin-700.eot");
                /* IE9 Compat Modes */
                src: local("Roboto Slab Bold"), local("RobotoSlab-Bold"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.eot?#iefix") format("embedded-opentype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.woff2") format("woff2"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.woff") format("woff"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.ttf") format("truetype"), url("../fonts/roboto-slab/roboto-slab-v7-latin-700.svg#RobotoSlab") format("svg");
                /* Legacy iOS */
            }

            a:focus,
            a:active {
                text-decoration: none;
                outline: none;
                transition: all 300ms ease 0s;
                -moz-transition: all 300ms ease 0s;
                -webkit-transition: all 300ms ease 0s;
                -o-transition: all 300ms ease 0s;
                -ms-transition: all 300ms ease 0s;
            }

            input,
            select,
            textarea {
                outline: none;
                appearance: unset !important;
                -moz-appearance: unset !important;
                -webkit-appearance: unset !important;
                -o-appearance: unset !important;
                -ms-appearance: unset !important;
            }

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                appearance: none !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none !important;
                -ms-appearance: none !important;
                margin: 0;
            }

            input:focus,
            select:focus,
            textarea:focus {
                outline: none;
                box-shadow: none !important;
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                -o-box-shadow: none !important;
                -ms-box-shadow: none !important;
            }

            input[type=checkbox] {
                appearance: checkbox !important;
                -moz-appearance: checkbox !important;
                -webkit-appearance: checkbox !important;
                -o-appearance: checkbox !important;
                -ms-appearance: checkbox !important;
            }

            input[type=radio] {
                appearance: radio !important;
                -moz-appearance: radio !important;
                -webkit-appearance: radio !important;
                -o-appearance: radio !important;
                -ms-appearance: radio !important;
            }

            .clear {
                clear: both;
            }

            h2 {
                font-size: 30px;
                margin: 0px;
            }

            body {
                font-size: 14px;
                line-height: 1.6;
                color: #222;
                font-weight: 400;
                font-family: 'Roboto Slab';
                margin: 0px;
                background: #222;
                position: relative;
                padding: 0px;
            }

            .main {
                padding: 50px 0;
                position: relative;
                z-index: 99;
            }

            .container {
                width: 1400px;
                margin: 0 auto;
                background: #fff;
            }

            fieldset {
                padding: 0px;
                margin: 0px;
                border: none;
                padding-left: 45px;
                padding-right: 55px;
                padding-top: 45px;
            }

            p.desc {
                margin: 0px;
                margin-bottom: 40px;
                color: #555;
            }

            .form-label {
                display: block;
                width: 100%;
                font-size: 16px;
                /* margin-bottom: 10px;*/
            }

            .text-input {
                font-size: 12px;
                color: #999;
                display: block;
                margin-top: 5px;
            }

            .text-input span {
                color: #222;
                font-weight: bold;
            }

            input,
            select {
                width: 100%;
                display: block;
                border: 1px solid #ebebeb;
                height: 37px;
                box-sizing: border-box;
                padding: 0 20px;
                color: #222;
                font-weight: bold;
                font-size: 14px;
                font-family: 'Roboto Slab';
            }

            #steps-uid-0-p-0 .form-row,
            #steps-uid-0-p-0 .form-group,
            #steps-uid-0-p-0 .form-date {
                width: 1000px;
            }

            .form-flex {
                margin: 0 -10px;
            }

            .form-flex .form-group {
                width: 50%;
                padding: 0 10px;
            }

            .form-group,
            .form-date {
                margin-bottom: 2px;
                position: relative;
            }

            .form-date-group {
                border: 1px solid transparent;
                border-radius: 5px;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                -o-border-radius: 5px;
                -ms-border-radius: 5px;
            }

            .form-date-group select {
                border: 1px solid #ebebeb;
                width: 100%;
                box-sizing: border-box;
                appearance: none !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none !important;
                -ms-appearance: none !important;
                position: relative;
                background: 0 0;
                z-index: 10;
                cursor: pointer;
                padding: 0 20px;
                height: 37px;
                font-size: 14px;
                font-family: 'Roboto Slab';
                color: #999;
                box-sizing: border-box;
                background-color: #fff;
                color: #222;
                font-weight: bold;
            }

            .form-date-item {
                position: relative;
                overflow: hidden;
                width: 100px;
                margin-right: 10px;
            }

            .vertical {
                display: block;
                width: 100%;
                overflow: hidden;
            }

            .vertical .steps {
                float: left;
                width: 310px;
            }

            .vertical .content,
            .vertical .actions {
                float: right;
                width: 1090px;
            }

            .content {
                height: 800px;
            }

            .steps ul {
                flex-direction: column;
                -moz-flex-direction: column;
                -webkit-flex-direction: column;
                -o-flex-direction: column;
                -ms-flex-direction: column;
                position: relative;
                padding-left: 40px;
                padding-top: 60px;
            }

            .steps ul li {
                padding-bottom: 30px;
                position: relative;
                z-index: 99;
            }

            .steps ul li a {
                text-decoration: none;
                color: #222;
            }

            .steps ul:after {
                position: absolute;
                content: '';
                width: 2px;
                height: 400px;
                background: #ebebeb;
                left: 64px;
                top: 50%;
                transform: translateY(-50%);
                -moz-transform: translateY(-50%);
                -webkit-transform: translateY(-50%);
                -o-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                z-index: 9;
            }

            .title {
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
            }

            .title .step-number {
                width: 40px;
                height: 40px;
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
                justify-content: center;
                -moz-justify-content: center;
                -webkit-justify-content: center;
                -o-justify-content: center;
                -ms-justify-content: center;
                border-radius: 50%;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                -o-border-radius: 50%;
                -ms-border-radius: 50%;
                background: #ebebeb;
                color: #999;
                margin-right: 15px;
                border: 5px solid #fff;
                font-weight: bold;
            }

            .title .step-text {
                font-weight: bold;
                color: #999;
            }

            .current .title .step-number {
                background: #4966b1;
                color: #fff;
            }

            .current .title .step-text {
                color: #4966b1;
            }

            .content h3 {
                display: none;
            }

            .content,
            .actions {
                background: #f8f8f8;
            }

            .actions {
                padding-bottom: 90px;
            }

            .actions ul {
                padding-left: 45px;
                padding-right: 55px;
            }

            .actions ul .disabled {
                display: none;
            }

            .actions ul li {
                float: right;
            }

            .actions ul li:first-child {
                float: left;
            }

            .actions ul li:first-child a {
                background: #e8e8e8;
                color: #999;
            }

            .actions ul li a {
                width: 140px;
                height: 50px;
                color: #fff;
                background: #4966b1;
                align-items: center;
                -moz-align-items: center;
                -webkit-align-items: center;
                -o-align-items: center;
                -ms-align-items: center;
                justify-content: center;
                -moz-justify-content: center;
                -webkit-justify-content: center;
                -o-justify-content: center;
                -ms-justify-content: center;
                text-decoration: none;
            }

            .form-radio-flex {
                flex-wrap: wrap;
                -moz-flex-wrap: wrap;
                -webkit-flex-wrap: wrap;
                -o-flex-wrap: wrap;
                -ms-flex-wrap: wrap;
                margin: 0 -15px;
            }

            .form-radio-flex .form-radio-item {
                padding: 0 15px;
                margin-bottom: 25px;
            }

            .form-radio-flex input {
                width: 0;
                height: 0;
                position: absolute;
                left: -9999px;
            }

            .form-radio-flex input+label {
                margin: 0px;
                width: 223px;
                height: 133px;
                box-sizing: border-box;
                position: relative;
                display: inline-block;
                text-align: center;
                background-color: transparent;
                border: 1px solid transparent;
                text-align: center;
                text-transform: none;
                transition: border-color .15s ease-out, color .25s ease-out, background-color .15s ease-out, box-shadow .15s ease-out;
            }

            .form-radio-flex input+label img {
                width: 100%;
                height: 100%;
            }

            .form-radio-flex input:checked+label {
                border: 1px solid #4966b1;
                z-index: 1;
            }

            .form-radio-flex input:focus+label {
                outline: none;
            }

            .form-radio-flex input:hover {
                border: 1px solid #4966b1;
            }

            label.error {
                display: block;
                position: absolute;
                top: 0px;
                right: 0;
            }

            label.error:after {
                font-family: 'Material-Design-Iconic-Font';
                position: absolute;
                content: '\f135';
                right: 20px;
                top: 50px;
                font-size: 13px;
                color: #f63726;
            }

            input.error {
                border: 1px solid #f63726;
            }

            #find_bank {
                padding: 0 55px;
                width: 680px;
                margin-right: 20px;
            }

            #find_bank::-webkit-input-placeholder {
                font-weight: 400;
            }

            #find_bank::-moz-placeholder {
                font-weight: 400;
            }

            #find_bank:-ms-input-placeholder {
                font-weight: 400;
            }

            #find_bank:-moz-placeholder {
                font-weight: 400;
            }

            .submit {
                width: 150px;
                background: #666;
                color: #fff;
                font-weight: 400;
                cursor: pointer;
            }

            .submit:hover {
                background-color: #4d4d4d;
            }

            .form-find {
                position: relative;
                padding-bottom: 70px;
                border-bottom: 1px solid #ebebeb;
            }

            .form-icon {
                position: absolute;
                top: 12px;
                left: 20px;
                font-size: 18px;
                color: #999;
            }

            .choose-bank-desc {
                color: #666;
                margin: 0px;
                padding-top: 30px;
                padding-bottom: 35px;
            }

            #slider-margin {
                height: 9px;
                border: none;
                box-shadow: none;
                -moz-box-shadow: none;
                -webkit-box-shadow: none;
                -o-box-shadow: none;
                -ms-box-shadow: none;
                background: #e8e8e8;
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
                -o-border-radius: 0px;
                -ms-border-radius: 0px;
                position: relative;
                margin-top: 110px;
            }

            #slider-margin .noUi-marker-horizontal.noUi-marker-large,
            #slider-margin .noUi-marker-horizontal.noUi-marker {
                height: 0px;
            }

            #slider-margin .noUi-connect {
                background: #4966b1;
            }

            #slider-margin .noUi-connects {
                border-radius: 0px;
                -moz-border-radius: 0px;
                -webkit-border-radius: 0px;
                -o-border-radius: 0px;
                -ms-border-radius: 0px;
            }

            #slider-margin .noUi-handle {
                width: 15px;
                height: 30px;
                top: -12px;
                background: #e8e8e8;
                outline: none;
                border: none;
                right: -15px;
                border: 1px solid #4966b1;
                border-radius: 0px;
            }

            #slider-margin .noUi-handle:after,
            #slider-margin .noUi-handle:before {
                width: 0px;
            }

            #slider-margin .noUi-handle .noUi-tooltip {
                bottom: 33px;
                border: none;
                background: transparent;
                font-size: 16px;
                color: #4966b1;
                padding: 0px;
            }

            #slider-margin .noUi-pips {
                width: 96%;
            }

            #slider-margin .noUi-pips .noUi-value {
                top: -50px;
                font-size: 16px;
                color: #666;
            }

            #slider-margin .noUi-pips .noUi-value:before {
                content: '$';
            }

            #slider-margin .noUi-pips .noUi-value-horizontal {
                transform: none;
                -moz-transform: none;
                -webkit-transform: none;
                -o-transform: none;
                -ms-transform: none;
            }

            .your-money {
                font-size: 16px;
                color: #222;
                margin: 0px;
                padding-top: 62px;
            }

            .your-money .money {
                font-size: 28px;
                font-weight: bold;
            }

            @media screen and (max-width: 1024px) {
                .container {
                    width: calc(100% - 40px);
                    max-width: 100%;
                }

                .vertical .steps,
                .vertical .content,
                .vertical .actions {
                    float: none;
                    width: 100%;
                }

                #find_bank {
                    width: 100%;
                }

                .form-radio-flex input+label {
                    width: 190px;
                    height: 120px;
                }
            }

            @media screen and (max-width: 992px) {
                .content {
                    height: 900px;
                }

                .form-radio-flex input+label {
                    width: 100px;
                    height: 65px;
                }
            }

            @media screen and (max-width: 768px) {

                #steps-uid-0-p-0 .form-row,
                #steps-uid-0-p-0 .form-group,
                #steps-uid-0-p-0 .form-date {
                    width: 100%;
                }

                .form-flex {
                    flex-direction: column;
                    -moz-flex-direction: column;
                    -webkit-flex-direction: column;
                    -o-flex-direction: column;
                    -ms-flex-direction: column;
                    margin: 0px;
                }

                .form-flex .form-group {
                    margin-left: 12px;
                    padding: 0px;
                }

                fieldset,
                .actions ul {
                    padding-left: 30px;
                    padding-right: 30px;
                }

                #slider-margin .noUi-pips {
                    width: 94%;
                }
            }

            @media screen and (max-width: 480px) {

                .form-date-group,
                .form-find {
                    flex-direction: column;
                    -moz-flex-direction: column;
                    -webkit-flex-direction: column;
                    -o-flex-direction: column;
                    -ms-flex-direction: column;
                }

                .content {
                    height: 1050px;
                }

                #find_bank {
                    margin-bottom: 20px;
                }

                .actions ul li a {
                    width: 100px;
                }

                .form-radio-flex {
                    margin: 0 -5px;
                }

                .form-radio-flex .form-radio-item {
                    padding: 0 5px;
                }

                .form-radio-flex input+label {
                    width: 90px;
                    height: 61px;
                }
            }

            .form-enter {
                background-color: #ebebeb;
                border-radius: 5px;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
                margin: 20px -7px 25px -7px;
                padding: 5px 7px 16px 7px;
            }

            .form-control {
                width: 100%;
                max-width: 600px;
                min-width: 200px;
                max-height: 400px;
                min-height: 100px;
            }

            .form-radio-group {
                justify-content: space-between;
            }

            .form-radio-group label {
                width: 70%;
                display: flex;
            }

            .form-radio-group label input {
                width: 20px;
            }

            .location {
                margin-top: 85px
            }

            select {
                border-radius: 8px;
            }

            .scrollable-vertical {
                width: 100%;
                height: 555px;
                /* border: 1px solid #000; */
                overflow-y: scroll;
                /* Chỉ tạo cuộn dọc */
                overflow-x: hidden;
                /* Ẩn cuộn ngang nếu có */
                padding: 10px;
            }

            .form-box {
                display: inline-flex;
            }

            .form-box,
            .form-box-total {
                background-color: #fff;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
                margin-bottom: 35px;
                padding: 30px;
                width: 94%;
                border-top: 1px black solid;
            }

            .form-img {
                width: 25%;
                padding: 0 5px;
            }

            .form-img img {
                width: 100%;
            }

            .form-text {
                padding: 0 15px;
                width: 50%;
            }

            .scrollable-vertical h4 {
                margin: 12px 0;
                font-size: 16px;
            }

            .form-doc {
                width: 100%;
            }

            .form-doc p {
                margin-top: 0;
                font-size: 12px;
            }

            .form-doc ul li {
                margin-top: 0;
                font-size: 12px;
            }

            .form-check,
            .price-container {
                width: 25%;
                padding: 0 5px;
            }

            .checkbox-container {
                display: flex;
                align-items: center;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 92%;
                height: 11%;
            }

            .checkbox-container input[type="checkbox"] {
                margin-right: 10px;
                width: 8%;
            }

            .checkbox-container label {
                font-size: 14px;
                font-weight: bold;
                color: #333;
            }

            .form-box label {
                font-weight: bold;
                color: #333;
            }

            .form-check-select {
                width: 25%;
                height: 110%;
                margin-right: 6px;
            }

            .form-comf-50 {
                display: inline-block;
                width: 50%;
                flex-wrap: wrap;
                gap: 30px;
            }

            .form-comf-20 {
                display: inline-flex;
                width: 25%;
                flex-wrap: wrap;
                gap: 60px;
            }

            .item-container {
                width: 100%;
                display: flex;
            }

            .form-comf-70 {
                display: inline-block;
                width: 65%;
                flex-wrap: wrap;
                gap: 20px;
            }

            .form-comf-30 {
                display: inline-flex;
                width: 35%;
                justify-content: space-between;
                /* border-left:1px black solid ; */
                /* flex-wrap: wrap; 
              gap: 20px; */
            }

            .form-comf-text {
                margin-bottom: 20px;
            }

            .form-img-bike {
                width: 35%;
                padding: 0 5px;
            }

            .form-img-bike img {
                width: 100%;
            }

            .item-total {
                width: 100%;
                display: flex;
                justify-content: space-between;
                border-top: 2px dotted #666;
                margin-top: 15px;
            }

            .price-container {
                text-align: center;
                font-family: Arial, sans-serif;
            }

            .text-period {
                color: gray;
                margin-left: 5px;
                vertical-align: super;
            }

            .main-price {
                font-size: 20px;
                font-weight: unset;
                margin: 0;
                display: inline-block;
            }

            .price-note {
                font-size: 0.9em;
                color: gray;
                margin: 5px 0 30px 0;
            }

            .rent-button {
                background-color: #28a745;
                color: black;
                border: none;
                padding: 15px 20px;
                font-size: 1em;
                font-weight: bold;
                cursor: pointer;
                border-radius: 2px;
            }

            .rent-button:hover {
                background-color: #454545;
                color: white;
            }

            .hidden-next {
                display: block;
            }

            /*# sourceMappingURL=style.css.map */
        </style>
    </head>

    <body>
        <div class="main">
            <div class="container">
                <form method="POST" id="signup-form" class="signup-form" action="#">
                    <div>

                        <h3>Dates</h3>
                        <fieldset>
                            <h2>Connect Bank Account</h2>
                            <p class="desc">Please enter your infomation and proceed to next step so we can build your account</p>
                            <div class="form-row">
                                <div class="form-flex">
                                    <div class="form-group">
                                        <label for="pickupdate" class="form-label">Pickup Date</label>
                                        <input type="date" name="pickupdate" id="pickupdate" />
                                    </div>
                                    <div class="form-group">
                                        <label for="pickuptime" class="form-label">Pickup Time</label>
                                        <input type="time" name="pickuptime" id="pickuptime" />
                                    </div>
                                    <div class="form-group">
                                        <label for="returndate" class="form-label">Return Date</label>
                                        <input type="date" name="returndate" id="returndate" />
                                    </div>
                                    <div class="form-group">
                                        <label for="returntime" class="form-label">Return Time</label>
                                        <input type="time" name="returntime" id="returntime" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-row location">
                                <div class="form-flex">
                                    <div class="form-group">
                                        <label for="pickuplocation" class="form-label">Pickup Location</label>
                                        <select name="pickuplocation" id="pickuplocation" class="form-label">
                                            <option value="Ga Đà Nẵng-Số 202 đường Hải Phòng">Da Nang Railway Station-202 Hải Phòng Street
                                            </option>
                                            <option value="Da Nang International Airport">Da Nang International Airport</option>
                                            <option value="Your own address">Your own address</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="returnlocation" class="form-label">Return Location</label>
                                        <select name="returnlocation" id="returnlocation" class="form-label">
                                            <option value="Ga Đà Nẵng-Số 202 đường Hải Phòng">Da Nang Railway Station-202 Hải Phòng Street
                                            </option>
                                            <option value="Da Nang International Airport">Da Nang International Airport</option>
                                            <option value="Your own address">Your own address</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <h3>Motorbikes</h3>
                        <fieldset>
                            <h2>SELECTED MOTORBIKE CLASS</h2>
                            <p class="desc">Please enter your infomation and proceed to next step so we can build your account</p>
                            <div class="fieldset-content">
                                <div class="scrollable-vertical">
                                    <c:forEach items="${listM}" var="o">
                                        <div class="form-box">
                                            <div class="form-img-bike">
                                                <label for="body-bg"><img src="${o.image}" alt=""></label>
                                            </div>
                                            <div class="form-text">
                                                <h4>${o.model}</h4>
                                                <div class="form-doc" style="box-sizing: border-box;">
                                                    ${o.description}
                                                </div>
                                            </div>
                                            <div class="price-container">
                                                <h2 class="main-price">₫250.000/Day</h2>
                                                <p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                                <a class="rent-button">Rent this Motorbike</a>
                                            </div>
                                        </div>
                                    </c:forEach>
<!--                                    <div class="form-box">
                                        <div class="form-img-bike">
                                            <label for="body-bg"><img src="images/xe2.png" alt=""></label>
                                        </div>
                                        <div class="form-text">
                                            <h4>Honda Air Blade 125cc</h4>
                                            <div class="form-doc" style="box-sizing: border-box;">
                                                <p class="text-period">Lưu ý: Mầu sắc có thể khác nhau nhưng kiểu dáng xe giống như hình minh họa.
                                                </p>
                                                <ul>
                                                    <li>Mũ bảo hiểm 1/2 đầu</li>
                                                    <li>Áo mưa 1 lần</li>
                                                    <li>Bảo hiểm xe máy</li>
                                                    <li>Đăng ký xe photo</li>
                                                    <li>Dịch vụ cứu hộ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="price-container">
                                            <h2 class="main-price">₫200.000/Day</h2>
                                            <p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                            <a class="rent-button">Rent this Motorbike</a>
                                        </div>
                                    </div>
                                    <div class="form-box">
                                        <div class="form-img-bike">
                                            <label for="body-bg"><img src="images/xe3.png" alt=""></label>
                                        </div>
                                        <div class="form-text">
                                            <h4>Yamaha Sirius 110cc</h4>
                                            <div class="form-doc" style="box-sizing: border-box;">
                                                <p class="text-period">Lưu ý: Mầu sắc có thể khác nhau nhưng kiểu dáng xe giống như hình minh họa.
                                                </p>
                                                <ul>
                                                    <li>Mũ bảo hiểm 1/2 đầu</li>
                                                    <li>Áo mưa 1 lần</li>
                                                    <li>Bảo hiểm xe máy</li>
                                                    <li>Đăng ký xe photo</li>
                                                    <li>Dịch vụ cứu hộ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="price-container">
                                            <h2 class="main-price">₫130.000/Day</h2>
                                            <p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                            <a class="rent-button">Rent this Motorbike</a>
                                        </div>
                                    </div>
                                    <div class="form-box">
                                        <div class="form-img-bike">
                                            <label for="body-bg"><img src="images/xe4.png" alt=""></label>
                                        </div>
                                        <div class="form-text">
                                            <h4>Honda Vision 110cc</h4>
                                            <div class="form-doc" style="box-sizing: border-box;">
                                                <p class="text-period">Lưu ý: Mầu sắc có thể khác nhau nhưng kiểu dáng xe giống như hình minh họa.
                                                </p>
                                                <ul>
                                                    <li>Mũ bảo hiểm 1/2 đầu</li>
                                                    <li>Áo mưa 1 lần</li>
                                                    <li>Bảo hiểm xe máy</li>
                                                    <li>Đăng ký xe photo</li>
                                                    <li>Dịch vụ cứu hộ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="price-container">
                                            <h2 class="main-price">₫180.000/Day</h2>
                                            <p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                            <a class="rent-button">Rent this Motorbike</a>
                                        </div>
                                    </div>
                                    <div class="form-box">
                                        <div class="form-img-bike">
                                            <label for="body-bg"><img src="images/xe5.png" alt=""></label>
                                        </div>
                                        <div class="form-text">
                                            <h4>Honda WinnerX 150cc</h4>
                                            <div class="form-doc" style="box-sizing: border-box;">
                                                <p class="text-period">Lưu ý: Mầu sắc có thể khác nhau nhưng kiểu dáng xe giống như hình minh họa.
                                                </p>
                                                <ul>
                                                    <li>Mũ bảo hiểm 1/2 đầu</li>
                                                    <li>Áo mưa 1 lần</li>
                                                    <li>Bảo hiểm xe máy</li>
                                                    <li>Đăng ký xe photo</li>
                                                    <li>Dịch vụ cứu hộ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="price-container">
                                            <h2 class="main-price">₫300.000/Day</h2>
                                            <p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                            <a class="rent-button">Rent this Motorbike</a>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </fieldset>

                        <h3>Extras</h3>
                        <fieldset>
                            <h2>PROTECTIONS & COVERAGES</h2>
                            <p class="desc">Please enter your infomation and proceed to next step so we can build your account</p>
                            <div class="scrollable-vertical" id="protection">
                                <h4>SERVICES</h4>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/body-bg.jpg" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Xe đi đường dài</h4>
                                        <div class="form-doc" style="box-sizing: border-box;">
                                            <p>Khoản ph&iacute; n&agrave;y sẽ&nbsp;&aacute;p dụng&nbsp;cho c&aacute;c kh&aacute;ch h&agrave;ng
                                                sử dụng xe một trong trường hợp sau:</p>
                                            <ul>
                                                <li>Kh&aacute;ch thu&ecirc; xe đi&nbsp;đường d&agrave;i, ra khỏi nội th&agrave;nh Da Nang</li>
                                                <li>Xe đi phượt&nbsp;c&aacute;c tỉnh hoặc đến c&aacute;c địa h&igrave;nh v&ugrave;ng n&uacute;i.
                                                </li>
                                            </ul>
                                            <p>Lưu &yacute;: Đối với c&aacute;c kh&aacute;ch&nbsp;đi đường d&agrave;i chưa lựa
                                                chọn&nbsp;g&oacute;i ph&aacute;t sinh n&agrave;y, khi trả xe COLORMOTOR sẽ thu bổ sung của
                                                kh&aacute;ch. Để biết th&ecirc;m chi tiết&nbsp;vui l&ograve;ng li&ecirc;n hệ <a
                                                    href="tel:0338023344">0338.02.33.44</a> để được giải đ&aacute;p.</p>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-1" class="option-checkbox">
                                            <label for="daily-checkbox">₫50.000/Day</label>
                                        </div>
                                    </div>
                                </div>
                                <h4>PROTECTIONS & COVERAGES</h4>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/baohiemhonghocxe.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Bảo hiểm hỏng hóc 50k/ngày Yamaha Sirius & Honda Vision</h4>
                                        <div class="form-doc" style="box-sizing: border-box;">
                                            <p>Ph&iacute;&nbsp;50.000đ/ng&agrave;y &aacute;p dụng cho d&ograve;ng xe Honda Airblade 125cc
                                                v&agrave; Winner 150cc</p>
                                            <p>Khoản ph&iacute; n&agrave;y sẽ&nbsp;&aacute;p dụng&nbsp;cho c&aacute;c kh&aacute;ch h&agrave;ng
                                                sử dụng xe một trong trường hợp sau:</p>
                                            <ul>
                                                <li>G&oacute;i bảo hiểm &aacute;p dụng cho trường hợp kh&aacute;ch đi chuyển gặp bất kỳ vấn đề
                                                    g&igrave; hư hỏng&nbsp;li&ecirc;n quan đến xe m&aacute;y đang thu&ecirc;, sẽ được chi trả 100%
                                                    số tiền sửa chữa bao gồm cả vấn đề va chạm, tai nạn hư hại về xe.</li>
                                            </ul>
                                            <p>Lưu &yacute;: Đối với c&aacute;c kh&aacute;ch&nbsp;đi đường d&agrave;i n&ecirc;n&nbsp;lựa
                                                chọn&nbsp;g&oacute;i ph&aacute;t sinh n&agrave;y&nbsp;để an to&agrave;n v&agrave; y&ecirc;n
                                                t&acirc;m trong qu&aacute; tr&igrave;nh đi phượt,...</p>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-2" class="option-checkbox">
                                            <label for="daily-checkbox">₫50.000/Day</label>
                                        </div>
                                    </div>
                                </div>


                                <h4>EQUIPMENTS</h4>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/mubaohiem.jpg" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Mũ bảo hiểm 3/4</h4>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-3" class="option-checkbox">
                                            <select class="form-check-select" id="daily-select-1">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                            </select>
                                            <label for="daily-checkbox">₫10.000/Day</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/aophanquangthun1.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Dây đeo phản quang</h4>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-4" class="option-checkbox">
                                            <select class="form-check-select" id="daily-select-2">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                            </select>
                                            <label for="daily-checkbox">₫10.000/Day</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/aomuagiay.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Áo mưa rời + nylon bọc giầy</h4>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-5" class="option-checkbox">
                                            <select class="form-check-select" id="daily-select-3">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                            </select>
                                            <label for="daily-checkbox">₫40.000/Day</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/dungcuvaxe.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Dụng cụ vá xe</h4>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-6" class="option-checkbox">
                                            <label for="daily-checkbox">Free</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-box">
                                    <div class="form-img">
                                        <label for="body-bg"><img src="images/giakepdienthoai.png" alt=""></label>
                                    </div>
                                    <div class="form-text">
                                        <h4>Giá đỡ điện thoại</h4>
                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox-7" class="option-checkbox">
                                            <label for="daily-checkbox">Free</label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </fieldset>

                        <h3>Customer</h3>
                        <fieldset>
                            <h2>Personal information</h2>
                            <p class="desc">Please enter your infomation and proceed to next step so we can build your account</p>
                            <div class="fieldset-content">
                                <div class="form-row">
                                    <div class="form-flex">
                                        <div class="form-group">
                                            <label class="form-label">First Name</label>
                                            <input type="text" name="first_name" id="first_name" />
                                            <span class="text-input">First</span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Last Name</label>
                                            <input type="text" name="last_name" id="last_name" />
                                            <span class="text-input">Last</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-flex">
                                        <div class="form-group">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" name="email" id="email" />
                                            <span class="text-input">Example :<span> Jeff@gmail.com</span></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="phonenumber" class="form-label">Phone Numbers</label>
                                            <input type="text" name="phonenumber" id="phonenumber" />
                                            <span class="text-input">+84</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-flex">
                                        <div class="form-group">
                                            <label for="address" class="form-label">Address</label>
                                            <input type="text" name="address" id="address" />
                                        </div>
                                        <div class="form-group">
                                            <label for="city" class="form-label">City/Province</label>
                                            <input type="text" name="city" id="city" />
                                            <span class="text-input">Da Nang</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-flex">
                                        <div class="form-group">
                                            <label for="birth_date" class="form-label">Birth Date</label>
                                            <div class="form-date-group">
                                                <div class="form-date-item">
                                                    <select id="birth_date" name="birth_date"></select>
                                                    <span class="text-input">DD</span>
                                                </div>
                                                <div class="form-date-item">
                                                    <select id="birth_month" name="birth_month"></select>
                                                    <span class="text-input">MM</span>
                                                </div>
                                                <div class="form-date-item">
                                                    <select id="birth_year" name="birth_year"></select>
                                                    <span class="text-input">YYYY</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="nationality" class="form-label">Nationality</label>
                                            <input type="text" name="nationality" id="nationality" />
                                            <span class="text-input">Viet Nam</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-flex">
                                        <div class="form-group">
                                            <label for="gender" class="form-label">Gender</label>
                                            <div class="form-radio-group">
                                                <label><input type="radio" name="gender" value="Unknown"> Unknown</label>
                                                <label><input type="radio" name="gender" value="Male"> Male</label>
                                                <label><input type="radio" name="gender" value="Female"> Female</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="note" class="form-label">Note</label>
                                            <textarea name="note" id="note" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-enter">
                                    <div class="form-row">
                                        <div class="form-flex">
                                            <div class="form-group" style="width: 230%;">
                                                <label for="drivernumber" class="form-label">Driver's License Number</label>
                                                <input type="text" name="drivernumber" id="drivernumber" />
                                            </div>
                                            <div class="form-group">
                                                <label for="issuedon" class="form-label">Issued On</label>
                                                <input type="date" name="issuedon" id="issuedon" />
                                            </div>
                                            <div class="form-group">
                                                <label for="expdate" class="form-label">Exp. Date</label>
                                                <input type="date" name="expdate" id="expdate" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <h3>Confirm</h3>
                        <fieldset>
                            <h2>Set Financial Goals</h2>
                            <p class="desc">Set up your money limit to reach the future plan</p>
                            <div class="fieldset-content">
                                <div class="scrollable-vertical">
                                    <h4>DATE & TIME</h4>
                                    <div class="form-box">
                                        <div class="form-comf-20">
                                            <div>
                                                <label for="pickupdatetext" class="form-label">Pickup Date</label>
                                                <p id="pickupdatetext"></p>
                                            </div>
                                            <div>
                                                <label for="pickuploctext" class="form-label">Pickup Location</label>
                                                <p id="pickuploctext"></p>
                                            </div>

                                        </div>
                                        <div class="form-comf-20">
                                            <div>
                                                <label for="pickuptimetext" class="form-label">Pickup Time</label>
                                                <p id="pickuptimetext"></p>
                                            </div>
                                            <div>
                                                <label for="returnloctext" class="form-label">Return Location</label>
                                                <p id="returnloctext"></p>
                                            </div>

                                        </div>
                                        <div class="form-comf-20">
                                            <div>
                                                <label for="returndatetext" class="form-label">Return Date</label>
                                                <p id="returndatetext"></p>
                                            </div>
                                        </div>
                                        <div class="form-comf-20">
                                            <div>
                                                <label for="returntimetext" class="form-label">Return Time</label>
                                                <p id="returntimetext"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <h4>SELECTED MOTORBIKE CLASS</h4>
                                    <div id="savedBikeContainer"></div>
                                    <h4>ACCOMPANIED SERVICES</h4>
                                    <div id="savedItemsContainer">
                                    </div>
                                    <h4>GENERAL</h4>
                                    <div class="form-box">
                                        <div class="form-comf-50">
                                            <div class="form-comf-text">
                                                <label for="firstnametext" class="form-label">First Name</label>
                                                <p id="firstnametext"></p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="emailaddresstext" class="form-label">Email Address</label>
                                                <p id="emailaddresstext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="addresstext" class="form-label">Address</label>
                                                <p id="addresstext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="birthdaytext" class="form-label">Birthday</label>
                                                <p id="birthdaytext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="gendertext" class="form-label">Gender</label>
                                                <p id="gendertext"> </p>
                                            </div>
                                        </div>
                                        <div class="form-comf-50">
                                            <div class="form-comf-text">
                                                <label for="lastnametext" class="form-label">Last Name</label>
                                                <p id="lastnametext"></p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="phonetext" class="form-label">Phone Number</label>
                                                <p id="phonetext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="citytext" class="form-label">City/Province</label>
                                                <p id="citytext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="nationalitytext" class="form-label">Nationality</label>
                                                <p id="nationalitytext"> </p>
                                            </div>
                                            <div class="form-comf-text">
                                                <label for="notetext" class="form-label">Note</label>
                                                <p id="notetext"> </p>

                                            </div>
                                        </div>
                                    </div>
                                    <h4>TOTAL</h4>
                                    <div class="form-box-total" id="form-box-total">

                                    </div>
                                    <div class="form-check">
                                        <div class="checkbox-container">
                                            <input type="checkbox" id="daily-checkbox">
                                            <label for="daily-checkbox">Term and conditions</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>



                        <h3>Payments</h3>
                        <fieldset>
                            <h2>Connect Bank Account</h2>
                            <p class="desc">Please enter your infomation and proceed to next step so we can build your account</p>
                            <div class="fieldset-content">
                                <div class="form-group">
                                    <label for="find_bank" class="form-label">Find Your Bank</label>
                                    <div class="form-find">
                                        <input type="text" name="find_bank" id="find_bank" placeholder="Ex. Techcombank" />
                                        <input type="submit" value="Search" class="submit">
                                        <span class="form-icon"><i class="zmdi zmdi-search"></i></span>
                                    </div>
                                </div>
                                <div class="choose-bank">
                                    <p class="choose-bank-desc">Or choose from these popular bank</p>
                                    <div class="form-radio-flex">
                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_1" value="bank_1" checked="checked" />
                                            <label for="bank_1"><img src="images/bank-1.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_2" value="bank_2" />
                                            <label for="bank_2"><img src="images/bank-2.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_3" value="bank_3" />
                                            <label for="bank_3"><img src="images/bank-3.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_4" value="bank_4" />
                                            <label for="bank_4"><img src="images/bank-4.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_5" value="bank_5" />
                                            <label for="bank_5"><img src="images/bank-5.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_6" value="bank_6" />
                                            <label for="bank_6"><img src="images/bank-6.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_7" value="bank_7" />
                                            <label for="bank_7"><img src="images/bank-7.jpg" alt=""></label>
                                        </div>

                                        <div class="form-radio-item">
                                            <input type="radio" name="choose_bank" id="bank_8" value="bank_8" />
                                            <label for="bank_8"><img src="images/bank-8.jpg" alt=""></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                    </div>
                </form>
            </div>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="vendor/jquery-steps/jquery.steps.min.js"></script>
        <script src="vendor/minimalist-picker/dobpicker.js"></script>
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script src="vendor/wnumb/wNumb.js"></script>
        <script>
            (function ($) {



                var form = $("#signup-form");
                form.validate({
                    errorPlacement: function errorPlacement(error, element) {
                        element.before(error);
                    },
                    rules: {
                        email: {
                            email: true
                        }
                    },
                    onfocusout: function (element) {
                        $(element).valid();
                    },
                });
                form.children("div").steps({
                    headerTag: "h3",
                    bodyTag: "fieldset",
                    transitionEffect: "fade",
                    stepsOrientation: "vertical",
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',
                    labels: {
                        previous: 'Previous',
                        next: 'Next',
                        finish: 'Finish',
                        current: '',
                    },
                    onStepChanging: function (event, currentIndex, newIndex) {
                        if (currentIndex === 0) {
                            form.parent().parent().parent().append('<div class="footer footer-' + currentIndex + '"></div>');
                        }
                        if (currentIndex === 1) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-0').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 2) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-1').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 3) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-2').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 4) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-3').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 5) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-4').addClass('footer-' + currentIndex + '');
                        }

                        // if(currentIndex === 4) {
                        //     form.parent().parent().parent().append('<div class="footer" style="height:752px;"></div>');
                        // }
                        form.validate().settings.ignore = ":disabled,:hidden";
                        return form.valid();
                    },
                    onFinishing: function (event, currentIndex) {
                        form.validate().settings.ignore = ":disabled";
                        return form.valid();
                    },
                    onFinished: function (event, currentIndex) {
                        alert('Submited');
                    },
                    onStepChanged: function (event, currentIndex, priorIndex) {

                        var nextButton = document.querySelector('.wizard .actions a[href="#next"]');

                        if (currentIndex === 1) {
                            if (nextButton) {
                                nextButton.style.display = 'none';
                            }
                        } else {
                            if (nextButton) {
                                nextButton.style.display = '';
                            }
                        }

                        if (currentIndex !== 4) {
                            nextButton.style.pointerEvents = 'auto';
                            nextButton.style.color = 'white';
                            nextButton.style.background = '#4966b1';
                        }

                        if (currentIndex === 4) { // Bước thứ tư (index bắt đầu từ 0)
                            // Lấy dữ liệu đã lưu từ localStorage và thêm lại vào savedItemsContainer
                            storedFormData = {
                                pickupdate: document.getElementById('pickupdate').value,
                                pickuptime: document.getElementById('pickuptime').value,
                                returndate: document.getElementById('returndate').value,
                                returntime: document.getElementById('returntime').value,
                                pickuplocation: document.getElementById('pickuplocation').value,
                                returnlocation: document.getElementById('returnlocation').value
                            };
                            if (storedFormData) {
                                document.getElementById('pickupdatetext').textContent = storedFormData.pickupdate;
                                document.getElementById('pickuploctext').textContent = storedFormData.pickuplocation;
                                document.getElementById('pickuptimetext').textContent = storedFormData.pickuptime;
                                document.getElementById('returnloctext').textContent = storedFormData.returnlocation;
                                document.getElementById('returndatetext').textContent = storedFormData.returndate;
                                document.getElementById('returntimetext').textContent = storedFormData.returntime;
                            }

                            const savedItemsContainer = document.getElementById('savedItemsContainer');
                            savedItemsContainer.innerHTML = ''; // Clear any previous 

                            const checkboxStates = {};
                            const selectStates = {};


                            const checkboxContainer = document.getElementById('protection');

                            // Lấy tất cả các checkbox trong div
                            const checkboxes = checkboxContainer.querySelectorAll('.option-checkbox:checked');

                            // Lặp qua từng checkbox và lấy thông tin
                            checkboxes.forEach(checkbox => {
                                checkboxStates[checkbox.id] = checkbox.checked;
                                const formBox = checkbox.closest('.form-box');
                                if (formBox) {
                                    savedItemsContainer.insertAdjacentHTML('beforeend', formBox.outerHTML);
                                    const selects = formBox.querySelectorAll('.form-check-select');
                                    selects.forEach(select => {
                                        selectStates[select.id] = select.value;
                                    });
                                }
                            });

                            if (checkboxStates) {
                                Object.keys(checkboxStates).forEach(checkboxId => {
                                    const checkbox = document.querySelector(`#savedItemsContainer #${checkboxId}`);
                                    if (checkbox) {
                                        checkbox.checked = checkboxStates[checkboxId];
                                        checkbox.disabled = true;
                                    }
                                });
                            }

                            if (selectStates) {
                                Object.keys(selectStates).forEach(selectId => {
                                    const select = document.querySelector(`#savedItemsContainer #${selectId}`);
                                    if (select) {
                                        select.value = selectStates[selectId];
                                        select.disabled = true;
                                    }
                                });
                            }

                            const formData = {
                                first_name: document.getElementById('first_name').value,
                                last_name: document.getElementById('last_name').value,
                                email: document.getElementById('email').value,
                                phonenumber: document.getElementById('phonenumber').value,
                                address: document.getElementById('address').value,
                                city: document.getElementById('city').value,
                                birth_month: document.getElementById('birth_month').value,
                                birth_date: document.getElementById('birth_date').value,
                                birth_year: document.getElementById('birth_year').value,
                                nationality: document.getElementById('nationality').value,
                                gender: document.querySelector('input[name="gender"]:checked') ? document.querySelector('input[name="gender"]:checked').value : '',
                                note: document.getElementById('note').value
                            };

                            if (formData) {
                                document.getElementById('firstnametext').textContent = formData.first_name;
                                document.getElementById('lastnametext').textContent = formData.last_name;
                                document.getElementById('emailaddresstext').textContent = formData.email;
                                document.getElementById('phonetext').textContent = formData.phonenumber;
                                document.getElementById('addresstext').textContent = formData.address;
                                document.getElementById('citytext').textContent = formData.city;
                                document.getElementById('birthdaytext').textContent = `${formData.birth_date}/${formData.birth_month}/${formData.birth_year}`;
                                                        document.getElementById('nationalitytext').textContent = formData.nationality;
                                                        document.getElementById('gendertext').textContent = formData.gender;
                                                        document.getElementById('notetext').textContent = formData.note;
                                                    }

                                                    // Thêm tiêu đề h4 và dữ liệu số lượng với giá tiền vào div cụ thể trong item-container
                                                    const formBoxTotal = document.getElementById('form-box-total');
                                                    formBoxTotal.innerHTML = '';
                                                    let totalAmount = 0;

                                                    const savedBike = document.getElementById('savedBikeContainer');
                                                    const title = savedBike.querySelector('h4').textContent;
                                                    const priceLabel = savedBike.querySelector('.main-price').textContent;
                                                    let price = 0;

                                                    if (priceLabel.trim().toLowerCase() !== 'free') {
                                                        price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                                    }

                                                    // Calculate total price
                                                    const pickupDateText = storedFormData.pickupdate;
                                                    const returnDateText = storedFormData.returndate;

                                                    // Chuyển các chuỗi ngày thành đối tượng Date
                                                    const pickupDate = new Date(pickupDateText);
                                                    const returnDate = new Date(returnDateText);

                                                    // Tính số ngày chênh lệch
                                                    const differenceInTime = returnDate.getTime() - pickupDate.getTime();
                                                    const differenceInDays = differenceInTime / (1000 * 3600 * 24);

                                                    // Quantity là số ngày chênh lệch giữa ngày trả và ngày pickup
                                                    const quantity = Math.max(1, Math.ceil(differenceInDays)); // Đảm bảo quantity ít nhất là 1
                                                    // const quantity = 1;

                                                    const totalPrice = quantity * price;
                                                    totalAmount += totalPrice;

                                                    // Create new div elements similar to formBoxTotal structure
                                                    const itemContainer = document.createElement('div');
                                                    itemContainer.classList.add('item-container');

                                                    const formComf70 = document.createElement('div');
                                                    formComf70.classList.add('form-comf-70');
                                                    formComf70.innerHTML = `<h4>${title}</h4>`;

                                                    const formComf30 = document.createElement('div');
                                                    formComf30.classList.add('form-comf-30');
                                                    formComf30.innerHTML = `
                              <div style="width= 30%; position: relative; right: 9px;">
                                  <p>x${quantity} Days</p>
                              </div>
                              <div style="width= 30%">
                                  <p>${priceLabel}</p>
                              </div>
                              <div style="width= 30%">
                                  <h4>₫${totalPrice.toLocaleString()}</h4>
                              </div>
                          `;

                                                    itemContainer.appendChild(formComf70);
                                                    itemContainer.appendChild(formComf30);
                                                    formBoxTotal.appendChild(itemContainer);


                                                    checkboxes.forEach(checkbox => {
                                                        checkboxStates[checkbox.id] = checkbox.checked;
                                                        const formBox = checkbox.closest('.form-box');
                                                        if (formBox) {
                                                            const selects = formBox.querySelectorAll('.form-check-select');
                                                            selects.forEach(select => {
                                                                selectStates[select.id] = select.value;
                                                            });

                                                            // Lấy nội dung từ thẻ h4 và label
                                                            const title = formBox.querySelector('h4').textContent;
                                                            const priceLabel = formBox.querySelector('label[for="daily-checkbox"]').textContent;
                                                            let price = 0;

                                                            if (priceLabel.trim().toLowerCase() !== 'free') {
                                                                price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                                            }

                                                            // Lấy số lượng từ thẻ select hoặc mặc định là 1
                                                            let quantity = 1;
                                                            const select = formBox.querySelector('select');
                                                            if (select) {
                                                                quantity = parseInt(select.value, 10) || 1;
                                                            }

                                                            // Tính tổng giá
                                                            const totalPrice = quantity * price;
                                                            totalAmount += totalPrice;

                                                            // Tạo các thẻ div mới
                                                            const itemContainer = document.createElement('div');
                                                            itemContainer.classList.add('item-container');

                                                            const formComf70 = document.createElement('div');
                                                            formComf70.classList.add('form-comf-70');
                                                            formComf70.innerHTML = `<h4>${title}</h4>`;

                                                            const formComf30 = document.createElement('div');
                                                            formComf30.classList.add('form-comf-30');
                                                            formComf30.innerHTML = `
                                  <div style="width= 30%">
                                      <p>x${quantity}</p>
                                  </div>
                                  <div style="width= 30%">
                                      <p>${priceLabel}</p>
                                  </div>
                                  <div style="width= 30%">
                                      <h4>₫${totalPrice.toLocaleString()}</h4>
                                  </div>
                                  `;

                                                            itemContainer.appendChild(formComf70);
                                                            itemContainer.appendChild(formComf30);
                                                            formBoxTotal.appendChild(itemContainer);
                                                        }
                                                    });
                                                    // Tạo thẻ div item-total và thêm vào cuối savedItemsContainer
                                                    const itemTotalContainer = document.createElement('div');
                                                    itemTotalContainer.classList.add('item-total');
                                                    itemTotalContainer.innerHTML = `
                              <h4>Total :</h4>
                              <h2>₫${totalAmount.toLocaleString()}</h2>
                          `;
                                                    formBoxTotal.appendChild(itemTotalContainer);

                                                    const checkbox = document.getElementById('daily-checkbox');
                                                    nextButton.style.pointerEvents = 'none';
                                                    nextButton.style.background = '#e8e8e8';
                                                    nextButton.style.color = '#999';

                                                    // Function to toggle the next button based on the checkbox state
                                                    function toggleNextButton() {
                                                        if (checkbox.checked) {
                                                            nextButton.style.pointerEvents = 'auto';
                                                            nextButton.style.color = 'white';
                                                            nextButton.style.background = '#4966b1';
                                                        } else {
                                                            nextButton.style.pointerEvents = 'none';
                                                            nextButton.style.background = '#e8e8e8';
                                                            nextButton.style.color = '#999';
                                                        }
                                                    }

                                                    // Add event listener to the checkbox to monitor changes
                                                    checkbox.addEventListener('change', toggleNextButton);

                                                    // Initial check
                                                    toggleNextButton();
                                                }


                                                return true;
                                            }


                                        });

                                        document.addEventListener('DOMContentLoaded', function () {
                                            // Function to simulate clicking on the next button of the multi-step form
                                            function goToNextStep() {
                                                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                                                if (nextButton) {
                                                    nextButton.click();
                                                }
                                            }

                                            // Get all elements with the class "rent-button"
                                            var rentButtons = document.querySelectorAll('.rent-button');

                                            // Add event listener to each "Rent this Motorbike" button
                                            rentButtons.forEach(function (button) {
                                                button.addEventListener('click', function () {
                                                    var parentDiv = event.target.closest('.form-box');
                                                    if (parentDiv) {
                                                        var parentDivClone = parentDiv.cloneNode(true);
                                                        var rentButtons = parentDivClone.querySelectorAll('.rent-button');
                                                        rentButtons.forEach(function (rentButton) {
                                                            rentButton.parentNode.removeChild(rentButton);
                                                        });
                                                        const savedBikeContainer = document.getElementById('savedBikeContainer');
                                                        savedBikeContainer.innerHTML = '';
                                                        if (savedBikeContainer) {
                                                            // parentDiv.parentNode.insertBefore(savedBikeContainer, parentDiv);
                                                            savedBikeContainer.appendChild(parentDivClone);
                                                        }
                                                        console.log(parentDiv);  // Here you can handle the parent div as needed
                                                    }
                                                    // Call the function to go to the next step
                                                    goToNextStep();
                                                });
                                            });
                                        });




                                        jQuery.extend(jQuery.validator.messages, {
                                            required: "",
                                            remote: "",
                                            email: "",
                                            url: "",
                                            date: "",
                                            dateISO: "",
                                            number: "",
                                            digits: "",
                                            creditcard: "",
                                            equalTo: ""
                                        });

                                        $.dobPicker({
                                            daySelector: '#birth_date',
                                            monthSelector: '#birth_month',
                                            yearSelector: '#birth_year',
                                            dayDefault: '',
                                            monthDefault: '',
                                            yearDefault: '',
                                            minimumAge: 0,
                                            maximumAge: 120
                                        });
                                        var marginSlider = document.getElementById('slider-margin');
                                        if (marginSlider != undefined) {
                                            noUiSlider.create(marginSlider, {
                                                start: [1100],
                                                step: 100,
                                                connect: [true, false],
                                                tooltips: [true],
                                                range: {
                                                    'min': 100,
                                                    'max': 2000
                                                },
                                                pips: {
                                                    mode: 'values',
                                                    values: [100, 2000],
                                                    density: 4
                                                },
                                                format: wNumb({
                                                    decimals: 0,
                                                    thousand: '',
                                                    prefix: '$ ',
                                                })
                                            });
                                            var marginMin = document.getElementById('value-lower'),
                                                    marginMax = document.getElementById('value-upper');

                                            marginSlider.noUiSlider.on('update', function (values, handle) {
                                                if (handle) {
                                                    marginMax.innerHTML = values[handle];
                                                } else {
                                                    marginMin.innerHTML = values[handle];
                                                }
                                            });
                                        }





                                    })(jQuery);
        </script>
    </body>

</html>
