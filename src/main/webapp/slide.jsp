<%-- 
    Document   : slide
    Created on : Jun 24, 2024, 11:37:22?AM
    Author     : ADMIN
--%>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Centered Tailwind Carousel with Autoplay</title>
        <link
            href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
            rel="stylesheet">
            <!-- Swiper CSS -->
            <link rel="stylesheet"
                  href="https://unpkg.com/swiper/swiper-bundle.min.css">
                <style>
                    /* CSS for Swiper Carousel */
                    .swiper-wrapper {

                        margin-left: 35%;
                        /* height: auto !important; */
                        transition-timing-function: linear !important;
                    }
                    .swiper-pagination{
                        position: absolute;
                        /*bottom: 0 !important;*/
                    }
                    .swiper-pagination-bullet {

                        background: #0d82a2;
                    }
                    .swiper-pagination-bullet-active {
                        
                        background: #0d82a2 !important;
                    }
                    .data-swiper-slide-index{
                        width: 265px;
                        
                    }
                    .swiper-slide{
                        border-radius: 40px !important;

                        /*box-shadow: #0d82a2 0 0 5px;*/
                        width: 400px !important;
                    }

                    .swiper-slide img {
                        height: 300px;
                        object-fit: cover; /* ??m b?o hình ?nh phù h?p v?i vùng tròn */
                    }
                    .rentalNow{
                        background: linear-gradient(243.4deg, rgb(2, 184, 175) 13%, rgb(4, 111, 212) 98%);
                    }

                </style>

                <!--    <body class="bg-gray-100 flex items-center justify-center min-h-screen">-->
                <div class="bg-gray-100 flex items-center justify-center min-h-screen">
                    <!-- Centered Carousel Container -->
                    <div class="w-full px-4 py-8" style="width: 90%;">
                        <div class="swiper centered-slide-carousel">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div
                                        class="w-full bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                                        <a href="#">
                                            <img class="p-8 rounded-t-lg"
                                                 src="images\imageM1.jpg"
                                                 alt="product image" />
                                        </a>
                                        <div class="px-5 pb-5">
                                            <a href="#">
                                                <h5
                                                    class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">Apple
                                                    Watch Series 7 GPS, Aluminium Case,
                                                    Starlight Sport</h5>
                                            </a>
                                            <div class="flex items-center mt-2.5 mb-5">
                                                <div
                                                    class="flex items-center space-x-1 rtl:space-x-reverse">
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                </div>
                                                <span
                                                    class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
                                            </div>
                                            <div class="flex items-center justify-between">
                                                <span
                                                    class="text-3xl font-bold text-gray-900 dark:text-white">$599</span>
                                                <a href="#"
                                                   class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center rentalNow">Thuê Xe Ngay 1</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="swiper-slide">
                                    <div
                                        class="w-full bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                                        <a href="#">
                                            <img class="p-8 rounded-t-lg"
                                                 src="images\imageM7.jpg"
                                                 alt="product image" />
                                        </a>
                                        <div class="px-5 pb-5">
                                            <a href="#">
                                                <h5
                                                    class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">Apple
                                                    Watch Series 7 GPS, Aluminium Case,
                                                    Starlight Sport</h5>
                                            </a>
                                            <div class="flex items-center mt-2.5 mb-5">
                                                <div
                                                    class="flex items-center space-x-1 rtl:space-x-reverse">
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                </div>
                                                <span
                                                    class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
                                            </div>
                                            <div class="flex items-center justify-between">
                                                <span
                                                    class="text-3xl font-bold text-gray-900 dark:text-white">$599</span>
                                                <a href="#"
                                                   class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center rentalNow">Thuê Xe Ngay 2</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="swiper-slide">
                                    <div
                                        class="w-full bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                                        <a href="#">
                                            <img class="p-8 rounded-t-lg"
                                                 src="images\imageM3.jpg"
                                                 alt="product image" />
                                        </a>
                                        <div class="px-5 pb-5">
                                            <a href="#">
                                                <h5
                                                    class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">Apple
                                                    Watch Series 7 GPS, Aluminium Case,
                                                    Starlight Sport</h5>
                                            </a>
                                            <div class="flex items-center mt-2.5 mb-5">
                                                <div
                                                    class="flex items-center space-x-1 rtl:space-x-reverse">
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                </div>
                                                <span
                                                    class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
                                            </div>
                                            <div class="flex items-center justify-between">
                                                <span
                                                    class="text-3xl font-bold text-gray-900 dark:text-white">$599</span>
                                                <a href="#"
                                                   class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center rentalNow">Thuê Xe Ngay 3</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="swiper-slide">
                                    <div
                                        class="w-full bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                                        <a href="#">
                                            <img class="p-8 rounded-t-lg"
                                                 src="images\imageM6.jpg"
                                                 alt="product image" />
                                        </a>
                                        <div class="px-5 pb-5">
                                            <a href="#">
                                                <h5
                                                    class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">Apple
                                                    Watch Series 7 GPS, Aluminium Case,
                                                    Starlight Sport</h5>
                                            </a>
                                            <div class="flex items-center mt-2.5 mb-5">
                                                <div
                                                    class="flex items-center space-x-1 rtl:space-x-reverse">
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                    <svg class="w-4 h-4 text-yellow-300"
                                                         aria-hidden="true"
                                                         xmlns="http://www.w3.org/2000/svg"
                                                         fill="currentColor"
                                                         viewBox="0 0 22 20">
                                                        <path
                                                            d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                                    </svg>
                                                </div>
                                                <span
                                                    class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">5.0</span>
                                            </div>
                                            <div class="flex items-center justify-between">
                                                <span
                                                    class="text-3xl font-bold text-gray-900 dark:text-white">$599</span>
                                                <a href="#"
                                                   class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center rentalNow">Thuê Xe Ngay 4</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Pagination -->
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
                <script>
                    // Initialize Swiper with autoplay
                    var swiper = new Swiper('.centered-slide-carousel', {
                        slidesPerView: 3,
                        spaceBetween: 30,
                        centeredSlides: true,
                        loop: true,
                        autoplay: {
                            delay: 2500,
                            disableOnInteraction: false
                        },
                        pagination: {
                            el: '.swiper-pagination',
                            clickable: true
                        },
                        navigation: {
                            nextEl: '.swiper-button-next',
                            prevEl: '.swiper-button-prev'
                        },
                        breakpoints: {
                            640: {
                                slidesPerView: 1,
                                spaceBetween: 20
                            },
                            768: {
                                slidesPerView: 2,
                                spaceBetween: 30
                            },
                            1024: {
                                slidesPerView: 3,
                                spaceBetween: 40
                            }
                        }
                    });
                </script>



