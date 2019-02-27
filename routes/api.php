<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::any('get/pcalist/{state_id}/{division_id}/{user_id}','InnerApiController@getPcaList');
Route::any('get/agreement_attachment/{agreement_id}','InnerApiController@getAttachmentList');
Route::any('get/agreementlist/{pca_id}/{user_id}','InnerApiController@getAgreementList');
Route::any('changeAttachmentStatus/{attachId}/{checkValue}/{user_id}','InnerApiController@changeAttachmentStatus');
Route::any('post/upload-attachment','InnerApiController@uploadAttachment');
Route::any('post/upload-other-attachment','InnerApiController@uploadOtherAttachment');
Route::any('get/userlist/{privilege}/{pca}/{agreement}','InnerApiController@getUserListByPrivilege');
