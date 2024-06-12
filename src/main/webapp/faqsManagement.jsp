<%-- 
    Document   : faqsManage
    Created on : May 25, 2024, 5:45:19 PM
    Author     : DiepTCNN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">


        <title>bs4 crud users - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- modal -->
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- MDB CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" rel="stylesheet">
        <!-- end modal -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                background: #eee;
            }

            .m-b-sm {
                margin-bottom: 10px;
            }

            /* FAQ */
            .faq-item {
                padding: 20px;
                margin-bottom: 2px;
                background: #fff;
            }

            .faq-question {
                font-size: 18px;
                font-weight: 600;
                color: #1ab394;
                display: block;
            }

            .faq-question:hover {
                color: #179d82;
            }

            .faq-answer {
                margin-top: 10px;
                background: #f3f3f4;
                border: 1px solid #e7eaec;
                border-radius: 3px;
                padding: 15px;
            }

            .faq-item .tag-item {
                background: #f3f3f4;
                padding: 2px 6px;
                font-size: 10px;
                text-transform: uppercase;
            }

            .ibox {
                clear: both;
                margin-bottom: 25px;
                margin-top: 0;
                padding: 0;
            }

            .ibox.collapsed .ibox-content {
                display: none;
            }

            .ibox.collapsed .fa.fa-chevron-up:before {
                content: "\f078";
            }

            .ibox.collapsed .fa.fa-chevron-down:before {
                content: "\f077";
            }

            .ibox:after,
            .ibox:before {
                display: table;
            }

            .ibox-title {
                -moz-border-bottom-colors: none;
                -moz-border-left-colors: none;
                -moz-border-right-colors: none;
                -moz-border-top-colors: none;
                background-color: #ffffff;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 3px 0 0;
                color: inherit;
                margin-bottom: 0;
                padding: 14px 15px 7px;
                min-height: 48px;
            }

            .ibox-content {
                background-color: #ffffff;
                color: inherit;
                padding: 15px 20px 20px 20px;
                border-color: #e7eaec;
                border-image: none;
                border-style: solid solid none;
                border-width: 1px 0;
            }

            .ibox-footer {
                color: inherit;
                border-top: 1px solid #e7eaec;
                font-size: 90%;
                background: #ffffff;
                padding: 10px 15px;
            }

            /* WRAPPERS */
            #wrapper {
                width: 100%;
                overflow-x: hidden;
            }

            .wrapper {
                padding: 0 20px;
            }

            .wrapper-content {
                padding: 20px 10px 40px;
            }

            #page-wrapper {
                padding: 0 15px;
                min-height: 568px;
                position: relative !important;
            }

            @media (min-width: 768px) {
                #page-wrapper {
                    position: inherit;
                    margin: 0 0 0 240px;
                    min-height: 2002px;
                }
            }

            /* breadcrumb */

            /* Style the list */
            ul.breadcrumb {
                padding: 10px 16px;
                list-style: none;
                background-color: #eee;
            }

            /* Display list items side by side */
            ul.breadcrumb li {
                display: inline;
                font-size: 18px;
            }

            /* Add a slash symbol (/) before/behind each list item */
            ul.breadcrumb li+li:before {
                padding: 8px;
                color: black;
                content: "/\00a0";
            }

            /* Add a color to all links inside the list */
            ul.breadcrumb li a {
                color: #0275d8;
                text-decoration: none;
            }

            /* Add a color on mouse-over */
            ul.breadcrumb li a:hover {
                color: #01447e;
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
       
        <!-- breadcrumb -->
        <div>
            <ul class="breadcrumb">
                <li><a href="homeStaff.jsp">Home</a></li>
                <li><a href="#">FAQs Management</a></li>
                <li>All List</li>
            </ul>
        </div>
        <!-- end breadcrumbs -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="text-center p-lg">
                                <h2>If you don't find the answer to your question</h2>
                                <span>add your question by selecting </span>
                                <!-- <button title="Create new cluster" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>
                                    <span class="bold">Add question</span></button> button -->
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" id="launchModalBtn" data-mdb-toggle="modal"
                                        data-mdb-target="#staticBackdrop1">
                                    <i class="fa fa-plus"></i>
                                    <span class="bold">Add question</span>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="staticBackdrop1" tabindex="-1"
                                     aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog d-flex justify-content-center">
                                        <div class="modal-content w-100">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">Add Question</h5>
                                                <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                                            </div>
                                            <div class="modal-body p-4">
                                                <form>
                                                    <!-- Email input -->
                                                    <div class="form-outline mb-4">
                                                        <input type="text" id="email1" class="form-control" />
                                                        <label class="form-label" for="email1">Question</label>
                                                    </div>

                                                    <!-- Password input -->
                                                    <div class="form-outline mb-4">
                                                        <!-- 
                                                        <label class="form-label" for="password1">Answer</label> -->
                                                        <textarea style="width: 99%;" class="form-label" rows="4" cols="50" placeholder="  Answer"></textarea>
                                                    </div>

                                                    <!-- Submit button -->
                                                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq1" class="faq-question">What It a long established
                                        fact that a reader ?</a>
                                    <small>Added by <strong>Alex Smith</strong> <i class="fa fa-clock-o"></i> Today 2:40 pm
                                        - 24.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Robert Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">License</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    42
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq1" class="panel-collapse collapse ">
                                        <div class="faq-answer">
                                            <p>
                                                It is a long established fact that a reader will be distracted by the
                                                readable content of a page when looking at its layout. The point of
                                                using Lorem Ipsum is that it has a more-or-less normal distribution of
                                                letters, as opposed to using 'Content here, content here', making it
                                                look like readable English.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq2" class="faq-question">Many desktop publishing
                                        packages ?</a>
                                    <small>Added by <strong>Mark Nowak</strong> <i class="fa fa-clock-o"></i> Today 3:30 pm
                                        - 11.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Robert Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">License</span>
                                        <span class="tag-item">CC</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    24
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq2" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Many desktop publishing packages and web page editors now use Lorem
                                                Ipsum as their default model text, and a search for 'lorem ipsum' will
                                                uncover many web sites still in their infancy. Various versions have
                                                evolved over the years, sometimes by accident, sometimes on purpose
                                                (injected humour and the like).
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq3" class="faq-question">Ipsum generators on the
                                        Internet tend ?</a>
                                    <small>Added by <strong>Monica Rother</strong> <i class="fa fa-clock-o"></i> Yestorday
                                        7:60 pm - 12.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Alex Berg</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">Web App</span>
                                        <span class="tag-item">Instruction</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    22
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq3" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Ipsum generators on the Internet tend to repeat predefined chunks as
                                                necessary, making this the first true generator on the Internet. It uses
                                                a dictionary of over 200 Latin words, combined with a handful of model
                                                sentence structures, to generate Lorem Ipsum which looks reasonable. The
                                                generated Lorem Ipsum is therefore always free from repetition, injected
                                                humour, or non-characteristic words etc.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq4" class="faq-question">What Finibus Bonorum et
                                        Malorum mean ?</a>
                                    <small>Added by <strong>Janet North</strong> <i class="fa fa-clock-o"></i> Today 2:43 pm
                                        - 22.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Robert Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Buttons</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    65
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq4" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus
                                                Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written
                                                in 45 BC. This book is a treatise on the theory of ethics, very popular
                                                during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum
                                                dolor sit amet..", comes from a line in section 1.10.32.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq5" class="faq-question">The standard chunk of Lorem
                                        Ipsum used since ?</a>
                                    <small>Added by <strong>Robert Task</strong> <i class="fa fa-clock-o"></i> Today 1:23 pm
                                        - 12.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Sandra Smith</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">License</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    76
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq5" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                The standard chunk of Lorem Ipsum used since the 1500s is reproduced
                                                below for those interested. Sections 1.10.32 and 1.10.33 from "de
                                                Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact
                                                original form, accompanied by English versions from the 1914 translation
                                                by H. Rackham.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq6" class="faq-question">Contrary to popular belief,
                                        Lorem Ipsum ?</a>
                                    <small>Added by <strong>Monica Smith</strong> <i class="fa fa-clock-o"></i> Today 7:220
                                        pm - 13.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Robert Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Love</span>
                                        <span class="tag-item">CC</span>
                                        <span class="tag-item">Help</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    11
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq6" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Contrary to popular belief, Lorem Ipsum is not simply random text. It
                                                has roots in a piece of classical Latin literature from 45 BC, making it
                                                over 2000 years old. Richard McClintock, a Latin professor at
                                                Hampden-Sydney College
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq7" class="faq-question"> Many desktop publishing
                                        packages ? </a>
                                    <small>Added by <strong>Damien Sate</strong> <i class="fa fa-clock-o"></i> Yestorday
                                        4:50 pm - 8.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Alex Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">International</span>
                                        <span class="tag-item">What</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    64
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq7" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Many desktop publishing packages and web page editors now use Lorem
                                                Ipsum as their default model text, and a search for 'lorem ipsum' will
                                                uncover many web sites still in their infancy. Various versions have
                                                evolved over the years, sometimes by accident, sometimes on purpose
                                                (injected humour and the like).
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq8" class="faq-question">Lorem Ipsum, you need to be
                                        sure there isn't ?</a>
                                    <small>Added by <strong>Pablo Sarnoq</strong> <i class="fa fa-clock-o"></i> Today 1:30
                                        am - 1.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Natalie Cole</span>
                                    <div class="tag-list">
                                        <span class="tag-item">Translations</span>
                                        <span class="tag-item">CC</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    10
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq8" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                Lorem Ipsum, you need to be sure there isn't anything embarrassing
                                                hidden in the middle of text. All the Lorem Ipsum generators on the
                                                Internet tend to repeat predefined chunks as necessary, making this the
                                                first true generator on the Internet. It uses a dictionary of over 200
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="faq-item">
                            <div class="row">
                                <div class="col-md-7">
                                    <a data-toggle="collapse" href="#faq9" class="faq-question">There are many variations of
                                        passages ?</a>
                                    <small>Added by <strong>Monica Smith</strong> <i class="fa fa-clock-o"></i> Today 1:60
                                        pm - 11.06.2014</small>
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Alex Nowak</span>
                                    <div class="tag-list">
                                        <span class="tag-item">General</span>
                                        <span class="tag-item">License</span>
                                    </div>
                                </div>
                                <div class="col-md-2 text-right">
                                    <span class="small font-bold">Voting </span><br>
                                    23
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="faq9" class="panel-collapse collapse">
                                        <div class="faq-answer">
                                            <p>
                                                There are many variations of passages of Lorem Ipsum available, but the
                                                majority have suffered alteration in some form, by injected humour, or
                                                randomised words which don't look even slightly believable. If you are
                                                going to use a passage
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog d-flex justify-content-center">
                <div class="modal-content w-75">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Sign in</h5>
                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn-close"
                                data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <form>
                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="email" id="email1" class="form-control" />
                                <label class="form-label" for="email1">Email address</label>
                            </div>

                            <!-- password input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="password" id="password1" class="form-control" />
                                <label class="form-label" for="password1">Password</label>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init
                                    class="btn btn-primary btn-block">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <!-- MDB JS -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var myModal = new mdb.Modal(document.getElementById('staticBackdrop1'));

                // Lắng nghe sự kiện khi modal được ẩn
                myModal._element.addEventListener('hidden.bs.modal', function () {
                    // Reset các trường input trong modal khi nó bị ẩn
                    document.getElementById('email1').value = '';
                    document.getElementById('password1').value = '';
                });
            });

        </script>

    </body>

</html>
