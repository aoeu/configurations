// ==UserScript==
// @name         Redirect to HTML Gmail
// @namespace    https://gist.github.com/aoeu
// @version      1.0
// @include      /^https?\:\/\/(.+\.)?(gmail|mail\.google)\.com\/.*/
// @author       aoeu
// @run-at       document-start
// ==/UserScript==

document.onreadystatechange = function () {
	if (document.readyState === "interactive") {
		var htmlGmailURL = 'https://mail.google.com/mail/u/0/h/1pq68r75kzvdr';
		if (window.location.pathname == '/mail/u/0/') {
			return window.location.replace(htmlGmailURL);
		}
	}
}
