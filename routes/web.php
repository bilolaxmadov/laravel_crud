<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

Route::get('/', function () {
    return view('welcome');
});

Route::resource('products', ProductController::class);

use Illuminate\Support\Facades\Cache;

Route::get('/cache-test', function () {
    Cache::put('cache_key', 'cache_value', 300);
    return Cache::get('cache_key');
});

