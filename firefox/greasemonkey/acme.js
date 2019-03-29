// ==UserScript==
// @name        acme
// @namespace   aoeu
// @include     *
// @version     1
// @grant       none
// @require     https://code.jquery.com/jquery-3.2.0.min.js
// ==/UserScript==
this.$ = this.jQuery = jQuery.noConflict(true);
$('*').filter(function (i) {
  var bgcolor = $(this).css('background-color').replace(/\s/g, '');
  return bgcolor == '#FFFFFF' || bgcolor == '#ffffff' || bgcolor == 'rgb(255,255,255)' || bgcolor == 'rgba(255,255,255)' || bgcolor == 'rgb(250,251,252)';
}).css('background-color', '#FFFFEB');

