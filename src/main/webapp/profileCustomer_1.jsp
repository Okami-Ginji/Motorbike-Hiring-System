<%-- 
    Document   : profileCus
    Created on : 30 thg 5, 2024, 21:04:50
    Author     : MINH TUAN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Profile</title>

    <!-- Tailwind CSS -->
    <link href="https://www.loopple.com/css/vendor/tailwind.min.css" rel="stylesheet">
    <link href="https://www.loopple.com/css/tailwind/app.css?v=1.0.0" rel="stylesheet">
    <link href="" id="google-font-url" rel="stylesheet">

    <style>
        .font-display {
            font-family: inherit;
        }

        .font-body {
            font-family: inherit;
        }
    </style>

    <!-- CSS Links -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
 
    <link href="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/css/nucleo-icons.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/css/soft-ui-dashboard-tailwind.css">

    <style type="text/css">
        #tudienjp * :not(svg, path) {
            all: revert
        }

        #tudienjp svg {
            width: auto !important
        }

        #tudienjp {
            font-size: 18px !important;
            font-family: Arial, ヒラギノ角ゴ Pro W3, Hiragino Kaku Gothic Pro, Osaka, メイリオ, Meiryo, ＭＳ Ｐゴシック, MS PGothic, sans-serif !important;
            color: #000 !important;
            line-height: 1.5 !important;
            text-align: left !important
        }

        #tudienjp .o-result-item {
            line-height: 1.5;
            display: block;
            margin-right: 0;
            cursor: pointer
        }

        #tudienjp .o-result-item:hover {
            border-color: #c6d6ef !important
        }

        #tudienjp .o-selected-result {
            max-height: 300px;
            overflow-y: scroll
        }

        #tudienjp .o-selected-result::-webkit-scrollbar {
            width: 13px
        }

        #tudienjp .o-selected-result::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 3px 0 0 3px #fff;
            background: rgba(0, 0, 0, .2)
        }

        #tudienjp .o-pop-nav div {
            font-size: 14px;
            padding: 3.2px 8px
        }

        #tudienjp .o-pop-speak {
            margin-top: 5px;
            margin-right: 8px;
            font-size: 16px;
            cursor: pointer
        }

        #tudienjp .o-search-mobile {
            z-index: 99998;
            position: absolute;
            display: none
        }

        #tudienjp .o-popup-tag {
            z-index: 99999;
            position: absolute;
            display: none;
            padding: 10px 5px 10px 10px
        }

        #tudienjp .o-bg-white {
            background-color: #fff !important
        }

        #tudienjp .o-border {
            border: 1px solid #dee2e6 !important
        }

        #tudienjp .o-rounded {
            border-radius: 4px !important
        }

        #tudienjp .o-shadow {
            box-shadow: 0 8px 16px rgba(0, 0, 0, .15) !important
        }

        #tudienjp .o-btn-close {
            box-sizing: content-box;
            width: 16px;
            height: 16px;
            padding: 4px 4px;
            color: #000;
            background: transparent url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath d='M.293.293a1 1 0 011.414 0L8 6.586 14.293.293a1 1 0 111.414 1.414L9.414 8l6.293 6.293a1 1 0 01-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 01-1.414-1.414L6.586 8 .293 1.707a1 1 0 010-1.414z'/%3E%3C/svg%3E") 50%/16px auto no-repeat;
            border: 0;
            border-radius: 4px;
            opacity: .5;
            cursor: pointer
        }

        #tudienjp .o-btn-close:hover {
            opacity: .75
        }

        #tudienjp .o-me-1 {
            margin-right: 4px !important
        }

        #tudienjp .o-end-0 {
            right: 0 !important
        }

        #tudienjp .o-top-0 {
            top: 0 !important
        }

        #tudienjp .o-position-absolute {
            position: absolute !important
        }

        #tudienjp ul {
            padding-left: 32px;
            display: block;
            list-style-type: disc;
            -webkit-margin-before: 16px;
            margin-block-start: 16px;
            -webkit-margin-after: 16px;
            margin-block-end: 16px;
            -webkit-margin-start: 0;
            margin-inline-start: 0;
            -webkit-margin-end: 0;
            margin-inline-end: 0;
            -webkit-padding-start: 40px;
            padding-inline-start: 40px
        }

        #tudienjp .o-pt-1 {
            padding-top: 4px !important
        }

        #tudienjp .mark,
        #tudienjp mark {
            padding: 0 !important;
            background-color: #ffffe0 !important
        }

        #tudienjp .o-mt-1 {
            margin-top: 4px !important
        }

        #tudienjp .o-p-2 {
            padding: 8px !important
        }

        #tudienjp .o-mb-1 {
            margin-bottom: 4px !important
        }

        #tudienjp .o-border-3 {
            border-width: 3px !important
        }

        #tudienjp .o-text-secondary {
            color: #6c757d !important
        }

        #tudienjp .o-text-primary {
            cursor: pointer;
            color: #0d6efd
        }

        #tudienjp .o-text-primary:hover {
            text-decoration: underline
        }

        #tudienjp .o-w-100 {
            width: 100% !important
        }

        #tudienjp .o-link-danger {
            color: #dc3545
        }

        #tudienjp .o-link-danger:hover {
            color: #0d6efd
        }

        #tudienjp .o-link-ah:hover {
            color: #dc3545
        }

        #tudienjp .o-text-decoration-none {
            text-decoration: none !important
        }

        #tudienjp .o-fs-6,
        #tudienjp .o-small {
            font-size: 16px !important
        }

        #tudienjp .o-ms-1 {
            margin-left: 4px !important
        }

        #tudienjp .o-mt-2 {
            margin-top: 8px !important
        }

        #tudienjp .o-float-start {
            float: left !important
        }

        #tudienjp label {
            display: inline-block
        }

        #tudienjp .o-float-end {
            float: right !important
        }

        #tudienjp .o-link-secondary {
            color: #6c757d !important
        }

        #tudienjp .o-result-item .o-inflect {
            font-size: 14px;
            color: #666;
            overflow: hidden;
            text-overflow: ellipsis
        }

        #tudienjp .o-nav-tabs {
            border-bottom: 1px solid #dee2e6
        }

        #tudienjp .o-nav {
            display: flex;
            flex-wrap: wrap;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none
        }

        #tudienjp ul {
            margin-top: 0;
            margin-bottom: 16px
        }

        #tudienjp li {
            display: list-item;
            text-align: -webkit-match-parent
        }

        #tudienjp .o-nav-tabs .o-nav-item.show .o-nav-link,
        #tudienjp .o-nav-tabs .o-nav-link.active {
            color: #495057;
            background-color: #fff;
            border-color: #dee2e6 #dee2e6 #fff
        }

        #tudienjp .o-nav-link {
            display: block;
            padding: 8px 16px;
            color: #0d6efd;
            text-decoration: none;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
            cursor: pointer
        }

        #tudienjp .o-nav-tabs .o-nav-link {
            margin-bottom: -1px;
            background: 0 0;
            border: 1px solid transparent;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            line-height: 1.5
        }

        #tudienjp svg:not(:host).o-svg-inline--fa,
        #tudienjp svg:not(:root).o-svg-inline--fa {
            overflow: visible;
            box-sizing: content-box
        }

        #tudienjp .o-svg-inline--fa {
            display: inline-block;
            height: 16px;
            overflow: visible;
            vertical-align: -2px
        }

        #tudienjp .o-form-check {
            font-size: 16px;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: transparent;
            box-sizing: border-box;
            display: block;
            min-height: 1.5rem;
            padding-left: 1.5em;
            margin-bottom: 0
        }

        #tudienjp .o-form-check-input {
            box-sizing: border-box;
            margin: 0;
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
            width: 1em;
            height: 1em;
            margin-top: .25em;
            vertical-align: top;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: 50%;
            background-size: contain;
            border: 1px solid rgba(0, 0, 0, .25);
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            -webkit-print-color-adjust: exact;
            float: left;
            margin-left: -1.5em;
            border-radius: .25em
        }

        #tudienjp .o-form-check-input:before {
            content: ""
        }

        #tudienjp .o-form-check-input:checked[type=checkbox] {
            background-color: #0d6efd;
            border-color: #0d6efd;
            background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3E%3Cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='M6 10l3 3 6-6'/%3E%3C/svg%3E")
        }

        #tudienjp del {
            color: #6c757d !important
        }
    </style>
    <style id="mttstyle">
        #mttContainer {
            left: 0 !important;
            top: 0 !important;
            position: fixed !important;
            z-index: 100000200 !important;
            width: 1000px !important;
            margin-left: -500px !important;
            background-color: #00000000 !important;
            pointer-events: none !important;
        }

        .bootstrapiso .tooltip {
            width: auto !important;
            height: auto !important;
            background: transparent !important;
            border: none !important;
            border-radius: 0px !important;
            visibility: visible !important;
            pointer-events: none !important;
        }

        .bootstrapiso .tooltip-inner {
            font-size: 14px !important;
            max-width: 200px !important;
            text-align: center !important;
            backdrop-filter: blur(15px) !important;
            background-color: #e6f9ff !important;
            color: #000 !important;
            border-radius: .25rem !important;
            pointer-events: none !important;
        }

        .bootstrapiso .arrow::before {
            border-top-color: #b3ecff !important;
            border-bottom-color: #b3ecff !important;
        }
    </style>
</head>

<body class="  font-body " data-framework="tailwind">
    <div class="builder-container builder-container-preview  font-body ">
        <aside
            class="max-w-62.5 ease-nav-brand z-990 absolute inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 bg-white p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent text-slate-500"
            id="sidenav-main">
            <hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark">
            <div class="items-center block w-auto max-h-screen overflow-auto grow basis-full">
                <ul class="flex flex-col pl-0 mb-0">
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 45 40" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>shop</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-1716.000000, -439.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(0.000000, 148.000000)">
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span
                                class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Dashboard</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 shadow-soft-xl text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg bg-white px-4 font-semibold text-slate-700 transition-colors"
                            href="javascript:;">
                            <div
                                class="bg-gradient-to-tl from-purple-700 to-pink-500 shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>office</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(153.000000, 2.000000)">
                                                    <path class="opacity-60"
                                                        d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z">
                                                    </path>
                                                    <path class=""
                                                        d="M40.25,14 L24.5,14 C23.53225,14 22.75,14.78225 22.75,15.75 L22.75,38.5 L19.25,38.5 L19.25,22.75 C19.25,21.78225 18.46775,21 17.5,21 L1.75,21 C0.78225,21 0,21.78225 0,22.75 L0,40.25 C0,41.21775 0.78225,42 1.75,42 L40.25,42 C41.21775,42 42,41.21775 42,40.25 L42,15.75 C42,14.78225 41.21775,14 40.25,14 Z M12.25,36.75 L7,36.75 L7,33.25 L12.25,33.25 L12.25,36.75 Z M12.25,29.75 L7,29.75 L7,26.25 L12.25,26.25 L12.25,29.75 Z M35,36.75 L29.75,36.75 L29.75,33.25 L35,33.25 L35,36.75 Z M35,29.75 L29.75,29.75 L29.75,26.25 L35,26.25 L35,29.75 Z M35,22.75 L29.75,22.75 L29.75,19.25 L35,19.25 L35,22.75 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span
                                class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Tables</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center fill-current stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>credit-card</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(453.000000, 454.000000)">
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span
                                class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Billing</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>box-3d-50</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-2319.000000, -291.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(603.000000, 0.000000)">
                                                    <path class="fill-slate-800"
                                                        d="M22.7597136,19.3090182 L38.8987031,11.2395234 C39.3926816,10.9925342 39.592906,10.3918611 39.3459167,9.89788265 C39.249157,9.70436312 39.0922432,9.5474453 38.8987261,9.45068056 L20.2741875,0.1378125 L20.2741875,0.1378125 C19.905375,-0.04725 19.469625,-0.04725 19.0995,0.1378125 L3.1011696,8.13815822 C2.60720568,8.38517662 2.40701679,8.98586148 2.6540352,9.4798254 C2.75080129,9.67332903 2.90771305,9.83023153 3.10122239,9.9269862 L21.8652864,19.3090182 C22.1468139,19.4497819 22.4781861,19.4497819 22.7597136,19.3090182 Z">
                                                    </path>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M23.625,22.429159 L23.625,39.8805372 C23.625,40.4328219 24.0727153,40.8805372 24.625,40.8805372 C24.7802551,40.8805372 24.9333778,40.8443874 25.0722402,40.7749511 L41.2741875,32.673375 L41.2741875,32.673375 C41.719125,32.4515625 42,31.9974375 42,31.5 L42,14.241659 C42,13.6893742 41.5522847,13.241659 41,13.241659 C40.8447549,13.241659 40.6916418,13.2778041 40.5527864,13.3472318 L24.1777864,21.5347318 C23.8390024,21.7041238 23.625,22.0503869 23.625,22.429159 Z">
                                                    </path>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M20.4472136,21.5347318 L1.4472136,12.0347318 C0.953235098,11.7877425 0.352562058,11.9879669 0.105572809,12.4819454 C0.0361450918,12.6208008 6.47121774e-16,12.7739139 0,12.929159 L0,30.1875 L0,30.1875 C0,30.6849375 0.280875,31.1390625 0.7258125,31.3621875 L19.5528096,40.7750766 C20.0467945,41.0220531 20.6474623,40.8218132 20.8944388,40.3278283 C20.963859,40.1889789 21,40.0358742 21,39.8806379 L21,22.429159 C21,22.0503869 20.7859976,21.7041238 20.4472136,21.5347318 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Virtual
                                Reality</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 40 40" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>settings</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-2020.000000, -442.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(304.000000, 151.000000)">
                                                    <polygon class="fill-slate-800 opacity-60"
                                                        points="18.0883333 15.7316667 11.1783333 8.82166667 13.3333333 6.66666667 6.66666667 0 0 6.66666667 6.66666667 13.3333333 8.82166667 11.1783333 15.315 17.6716667">
                                                    </polygon>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M31.5666667,23.2333333 C31.0516667,23.2933333 30.53,23.3333333 30,23.3333333 C29.4916667,23.3333333 28.9866667,23.3033333 28.48,23.245 L22.4116667,30.7433333 L29.9416667,38.2733333 C32.2433333,40.575 35.9733333,40.575 38.275,38.2733333 L38.275,38.2733333 C40.5766667,35.9716667 40.5766667,32.2416667 38.275,29.94 L31.5666667,23.2333333 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M33.785,11.285 L28.715,6.215 L34.0616667,0.868333333 C32.82,0.315 31.4483333,0 30,0 C24.4766667,0 20,4.47666667 20,10 C20,10.99 20.1483333,11.9433333 20.4166667,12.8466667 L2.435,27.3966667 C0.95,28.7083333 0.0633333333,30.595 0.00333333333,32.5733333 C-0.0583333333,34.5533333 0.71,36.4916667 2.11,37.89 C3.47,39.2516667 5.27833333,40 7.20166667,40 C9.26666667,40 11.2366667,39.1133333 12.6033333,37.565 L27.1533333,19.5833333 C28.0566667,19.8516667 29.01,20 30,20 C35.5233333,20 40,15.5233333 40,10 C40,8.55166667 39.685,7.18 39.1316667,5.93666667 L33.785,11.285 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">RTL</span>
                        </a> </li>
                    <li class="w-full mt-4">
                        <h6 class="pl-6 ml-2 font-bold leading-tight uppercase text-xs opacity-60">Account pages</h6>
                    </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 46 42" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>customer-support</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-1717.000000, -291.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(1.000000, 0.000000)">
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span
                                class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Profile</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="12px" viewBox="0 0 40 44" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>document</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-1870.000000, -591.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(154.000000, 300.000000)">
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z">
                                                    </path>
                                                    <path class="fill-slate-800"
                                                        d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Sign
                                In</span>
                        </a> </li>
                    <li class="mt-0.5 w-full"> <a
                            class="py-2.7 text-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
                            href="javascript:;">
                            <div
                                class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
                                <svg width="12px" height="20px" viewBox="0 0 40 40" version="1.1"
                                    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <title>spaceship</title>
                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                        <g transform="translate(-1720.000000, -592.000000)" fill="#FFFFFF"
                                            fill-rule="nonzero">
                                            <g transform="translate(1716.000000, 291.000000)">
                                                <g transform="translate(4.000000, 301.000000)">
                                                    <path class="fill-slate-800"
                                                        d="M39.3,0.706666667 C38.9660984,0.370464027 38.5048767,0.192278529 38.0316667,0.216666667 C14.6516667,1.43666667 6.015,22.2633333 5.93166667,22.4733333 C5.68236407,23.0926189 5.82664679,23.8009159 6.29833333,24.2733333 L15.7266667,33.7016667 C16.2013871,34.1756798 16.9140329,34.3188658 17.535,34.065 C17.7433333,33.98 38.4583333,25.2466667 39.7816667,1.97666667 C39.8087196,1.50414529 39.6335979,1.04240574 39.3,0.706666667 Z M25.69,19.0233333 C24.7367525,19.9768687 23.3029475,20.2622391 22.0572426,19.7463614 C20.8115377,19.2304837 19.9992882,18.0149658 19.9992882,16.6666667 C19.9992882,15.3183676 20.8115377,14.1028496 22.0572426,13.5869719 C23.3029475,13.0710943 24.7367525,13.3564646 25.69,14.31 C26.9912731,15.6116662 26.9912731,17.7216672 25.69,19.0233333 L25.69,19.0233333 Z">
                                                    </path>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M1.855,31.4066667 C3.05106558,30.2024182 4.79973884,29.7296005 6.43969145,30.1670277 C8.07964407,30.6044549 9.36054508,31.8853559 9.7979723,33.5253085 C10.2353995,35.1652612 9.76258177,36.9139344 8.55833333,38.11 C6.70666667,39.9616667 0,40 0,40 C0,40 0,33.2566667 1.855,31.4066667 Z">
                                                    </path>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M17.2616667,3.90166667 C12.4943643,3.07192755 7.62174065,4.61673894 4.20333333,8.04166667 C3.31200265,8.94126033 2.53706177,9.94913142 1.89666667,11.0416667 C1.5109569,11.6966059 1.61721591,12.5295394 2.155,13.0666667 L5.47,16.3833333 C8.55036617,11.4946947 12.5559074,7.25476565 17.2616667,3.90166667 L17.2616667,3.90166667 Z">
                                                    </path>
                                                    <path class="fill-slate-800 opacity-60"
                                                        d="M36.0983333,22.7383333 C36.9280725,27.5056357 35.3832611,32.3782594 31.9583333,35.7966667 C31.0587397,36.6879974 30.0508686,37.4629382 28.9583333,38.1033333 C28.3033941,38.4890431 27.4704606,38.3827841 26.9333333,37.845 L23.6166667,34.53 C28.5053053,31.4496338 32.7452344,27.4440926 36.0983333,22.7383333 L36.0983333,22.7383333 Z">
                                                    </path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </svg>
                            </div> <span class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Sign
                                Up</span>
                        </a> </li>
                </ul>
            </div>
        </aside>
        <div class="ease-soft-in-out xl:ml-68.5 relative h-full max-h-screen rounded-xl transition-all duration-200"
            id="panel">
            <nav class="relative flex flex-wrap items-center justify-between px-0 py-2 mx-6 transition-all shadow-none duration-250 ease-soft-in rounded-2xl lg:flex-nowrap lg:justify-start"
                id="navbarTop" navbar-scroll="true">
                <div class="flex items-center justify-between w-full px-4 py-1 mx-auto flex-wrap-inherit">
                    <nav>
                        <ol class="flex flex-wrap pt-1 mr-12 bg-transparent rounded-lg sm:mr-16">
                            <li class="text-sm leading-normal"> <a class="opacity-50 text-slate-700"
                                    href="javascript:;">Pages</a> </li>
                            <li class="text-sm pl-2 capitalize leading-normal text-slate-700 before:float-left before:pr-2 before:text-gray-600 before:content-['/']"
                                aria-current="page">Tables</li>
                        </ol>
                        <h6 class="mb-0 font-bold capitalize">Tables</h6>
                    </nav>
                    <div class="flex items-center mt-2 grow sm:mt-0 sm:mr-6 md:mr-0 lg:flex lg:basis-auto">
                        <div class="flex items-center md:ml-auto md:pr-4">
                            <div
                                class="relative flex flex-wrap items-stretch w-full transition-all rounded-lg ease-soft">
                                <span
                                    class="text-sm ease-soft leading-5.6 absolute z-50 -ml-px flex h-full items-center whitespace-nowrap rounded-lg rounded-tr-none rounded-br-none border border-r-0 border-transparent bg-transparent py-2 px-2.5 text-center font-normal text-slate-500 transition-all">
                                    <i class="fas fa-search" aria-hidden="true"></i> </span> <input type="text"
                                    class="pl-8.75 text-sm focus:shadow-soft-primary-outline ease-soft w-1/100 leading-5.6 relative -ml-px block min-w-0 flex-auto rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding py-2 pr-3 text-gray-700 transition-all placeholder:text-gray-500 focus:border-fuchsia-300 focus:outline-none focus:transition-shadow"
                                    placeholder="Type here..." fdprocessedid="pcz3g">
                            </div>
                        </div>
                        </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="w-full px-6 py-6 mx-auto drop-zone loopple-min-height-78vh text-slate-500">
                <div class="relative flex flex-col flex-auto min-w-0 p-4 overflow-hidden break-words border-0 shadow-blur rounded-2xl bg-white/80 bg-clip-border mb-4 draggable"
                    draggable="true">
                    <div class="flex flex-wrap -mx-3">
                        <div class="flex-none w-auto max-w-full px-3">
                            <div
                                class="text-base ease-soft-in-out h-18.5 w-18.5 relative inline-flex items-center justify-center rounded-xl text-white transition-all duration-200">
                                <img src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/img/bruce-mars.jpg"
                                    alt="profile_image" class="w-full shadow-soft-sm rounded-xl">
                            </div>
                        </div>
                        <div class="flex-none w-auto max-w-full px-3 my-auto">
                            <div class="h-full">
                                <h5 class="mb-1">Alec Thompson</h5>
                                <p class="mb-0 font-semibold leading-normal text-sm">CEO / Co-Founder</p>
                            </div>
                        </div>
                        <div
                            class="w-full max-w-full px-3 mx-auto mt-4 sm:my-auto sm:mr-0 md:w-1/2 md:flex-none lg:w-4/12">
                        </div>
                    </div>
                </div>
                <div class="w-full pb-6 mx-auto removable">
                    <div class="flex flex-wrap -mx-3 drop-zone">
                        <div class="w-full max-w-full px-3 mb-4 draggable" draggable="true">
                            <div
                                class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border">
                                <div class="p-4 pb-0 mb-0 bg-white border-b-0 rounded-t-2xl">
                                    <div class="flex flex-wrap -mx-3">
                                        <div
                                            class="flex items-center w-full max-w-full px-3 shrink-0 md:w-8/12 md:flex-none">
                                            <h6 class="mb-0">Profile Information</h6>
                                        </div>
                                        <div class="w-full max-w-full px-3 text-right shrink-0 md:w-4/12 md:flex-none">
                                            <a href="javascript:;" data-target="tooltip_trigger" data-placement="top">
                                                <i class="leading-normal fas fa-user-edit text-sm text-slate-400"
                                                    aria-hidden="true"></i> </a>
                                            <div data-target="tooltip"
                                                class="px-2 py-1 text-center text-white bg-black rounded-lg text-sm hidden"
                                                role="tooltip" data-popper-placement="top"
                                                style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(1052px, -88px, 0px);">
                                                Edit Profile <div
                                                    class="invisible absolute h-2 w-2 bg-inherit before:visible before:absolute before:h-2 before:w-2 before:rotate-45 before:bg-inherit before:content-['']"
                                                    data-popper-arrow=""
                                                    style="position: absolute; left: 0px; transform: translate3d(0px, 0px, 0px);">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-auto p-4">
                                    <p class="leading-normal text-sm">Hi, I’m Alec Thompson, Decisions: If you can’t
                                        decide, the answer is no. If two equally difficult paths, choose the one more
                                        painful in the short term (pain avoidance is creating an illusion of equality).
                                    </p>
                                    <hr
                                        class="h-px my-6 bg-transparent bg-transparent bg-gradient-to-r from-transparent via-black/40 to-transparent">
                                    <ul class="flex flex-col pl-0 mb-0 rounded-lg">
                                        <li
                                            class="relative block px-4 py-2 pt-0 pl-0 leading-normal bg-white border-0 rounded-t-lg text-sm text-inherit">
                                            <strong class="text-slate-700">Full Name:</strong> &nbsp; Alec M. Thompson
                                        </li>
                                        <li
                                            class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                            <strong class="text-slate-700">Mobile:</strong> &nbsp; (44) 123 1234 123
                                        </li>
                                        <li
                                            class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                            <strong class="text-slate-700">Email:</strong> &nbsp; alecthompson@mail.com
                                        </li>
                                        <li
                                            class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-sm text-inherit">
                                            <strong class="text-slate-700">Location:</strong> &nbsp; USA
                                        </li>
                                        <li
                                            class="relative block px-4 py-2 pb-0 pl-0 bg-white border-0 border-t-0 rounded-b-lg text-inherit">
                                            <strong class="leading-normal text-sm text-slate-700">Social:</strong>
                                            &nbsp; <a
                                                class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center text-blue-800 align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-xs ease-soft-in bg-none"
                                                href="javascript:;"> <i class="fab fa-facebook fa-lg"
                                                    aria-hidden="true"></i> </a> <a
                                                class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-xs ease-soft-in bg-none text-sky-600"
                                                href="javascript:;"> <i class="fab fa-twitter fa-lg"
                                                    aria-hidden="true"></i> </a> <a
                                                class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-xs ease-soft-in bg-none text-sky-900"
                                                href="javascript:;"> <i class="fab fa-instagram fa-lg"
                                                    aria-hidden="true"></i> </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- Footer -->
        </div>

    </div>
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/chartjs.min.js"></script>
    <script src="https://demos.creative-tim.com/soft-ui-dashboard-tailwind/assets/js/plugins/perfect-scrollbar.min.js"
        async=""></script>
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script
        src="https://cdn.jsdelivr.net/gh/Loopple/loopple-public-assets@main/soft-ui-dashboard-tailwind/js/soft-ui-dashboard-tailwind.js"
        async=""></script>
</body>

</html>
