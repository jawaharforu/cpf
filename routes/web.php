<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('admin');
});
Route::get('/check', function () {
    dashBoardDetails();
});
Route::get('/curloutput', function() {
    $request_data = request()->all();
    dd($request_data);
});
Route::group( [ 'middleware' => [ 'web', '\crocodicstudio\crudbooster\middlewares\CBBackend' ], 'prefix' => config( 'crudbooster.ADMIN_PATH' ) ], function () {

    Route::any('users/userinfo/{any}', 'MainController@userinfo');
    //Route::any('inbox', 'MainController@inbox');
    //Route::any('outbox', 'MainController@outbox');
    Route::any('listing', 'MainController@listing');
    Route::any('renewal-list', 'MainController@renewalListing');
    Route::any('expired-list', 'MainController@expiredListing');
    Route::any('listStatusWise/{any}', 'MainController@listingStatusWise');

    Route::any('/', 'MainController@dashboard');

    Route::get('generatepdf/{id}/{copy}/{space}/{draft}','MainController@generatePDF');
    Route::get('generateword/{id}/{copy}/{space}','MainController@generateWord');

});

