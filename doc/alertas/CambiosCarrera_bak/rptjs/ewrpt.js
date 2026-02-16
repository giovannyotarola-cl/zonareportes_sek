// JavaScript for ASP Report Maker 4.0+
// (C) 2006-2010 e.World Technology Ltd.

var ewrptEmailDialog;
var ewrptEnv = YAHOO.env;
var ewrptUtil = YAHOO.util;
var ewrptDom = YAHOO.util.Dom;
var ewrptEvent = YAHOO.util.Event;
var ewrptGet = YAHOO.util.Get;
var ewrptLang = YAHOO.lang;
var ewrptConnect = YAHOO.util.Connect;
var ewrptWidget = YAHOO.widget;

// ewrpt_Page class
// Page Object
function ewrpt_Page(name) {
	this.Name = name;
	this.PageID = "";

	// validate function
	this.ValidateRequired = true;
}

// Submit language form
function ewrpt_SubmitLanguageForm(f) {
	if (!f) return;
	var url = new ewrpt_URL();
	if (f.language) {
		url.addArg("language", f.language.value, true);
		window.location = url.toString();
	}
}

var EWRPT_TABLE_CLASS = "ewTable";
//var EWRPT_TABLE_ROW_CLASSNAME = "ewTableRow";
//var EWRPT_TABLE_ALT_ROW_CLASSNAME = "ewTableAltRow";

// Get Ctrl key for multiple column sort
function ewrpt_Sort(e, url, type) {
	var newUrl = url;
	if (type == 2 && e.ctrlKey)
		newUrl += "&ctrl=1";
	location = newUrl;
	return true;
}

function ewrpt_SetFocus(input_object) {
	if (!input_object || !input_object.type)
		return;
	var type = input_object.type;	 			
	if (type == "radio" || type == "checkbox") {
		if (input_object[0])
			input_object[0].focus();
		else
			input_object.focus();
	}	else { 
		input_object.focus();  
	}  
	if (type == "text" || type == "password" || type == "textarea" || type == "file") {
			input_object.select();
	}
}

function ewrpt_OnError(input_object, error_message) {
	alert(error_message);
	ewrpt_SetFocus(input_object);
	return false;	
}

// Check if object has value
function ewrpt_HasValue(obj) {
	if (!obj)
		return true;
	var type = (!obj.type && obj[0]) ? obj[0].type : obj.type;
	if (type == "text" || type == "password" || type == "textarea" ||
		type == "file" || type == "hidden") {
		return (obj.value.length != 0);
	} else if (type == "select-one") {
		return (obj.selectedIndex > 0);
	} else if (type == "select-multiple") {
		return (obj.selectedIndex > -1);
	} else if (type == "checkbox") {
		if (obj[0]) {
			for (var i=0; i < obj.length; i++) {
				if (obj[i].checked)
				return true;
			}
			return false;
		}
	} else if (type == "radio") {
		if (obj[0]) {
			for (var i=0; i < obj.length; i++) {
				if (obj[i].checked)
				return true;
			}
			return false;
		} else {
			return obj.checked;
		}
	}
	return true;
}

function ewrpt_HtmlEncode(text) {
	var str = text;
	str = str.replace(/&/g, '&amp');
	str = str.replace(/\"/g, '&quot;');
	str = str.replace(/</g, '&lt;');
	str = str.replace(/>/g, '&gt;'); 
	return str;
}

// Extended basic search clear form
function ewrpt_ClearForm(objForm){
	with (objForm) {
		for (var i=0; i<elements.length; i++){
			var tmpObj = eval(elements[i]);
			if (tmpObj.type == "checkbox" || tmpObj.type == "radio"){
				tmpObj.checked = false;
			} else if (tmpObj.type == "select-one"){
				tmpObj.selectedIndex = 0;
			} else if (tmpObj.type == "select-multiple") {
				for (var j=0; j<tmpObj.options.length; j++)
					tmpObj.options[j].selected = false;
			} else if (tmpObj.type == "text"){
				tmpObj.value = "";
			}
		}
	}
}

// Handle search operator changed
function ewrpt_SrchOprChanged(id) {
	var elem = document.getElementById(id);
	if (!elem) return;
	var f = elem.form;
	var isBetween = (elem.options[elem.selectedIndex].value == "BETWEEN");
	var arEl, arChildren;
	arEl = document.getElementsByName("btw0_" + id.substr(4));
	for (var i=0; i < arEl.length; i++)
		arEl[i].style.display = (isBetween) ? "none" : "";
	arEl = document.getElementsByName("btw1_" + id.substr(4));
	for (var i=0; i < arEl.length; i++) {
		arEl[i].style.display = (isBetween) ? "" : "none";
	}
	var sv2, sc;
	sc = document.getElementsByName("sc_" + id.substr(4));
	sv2 = document.getElementById("sv2_" + id.substr(4));
	if (sc.length == 0 && sv2) sv2.disabled = !isBetween;
}

// Toggle filter panel
function ewrpt_ToggleFilterPanel() {
	if (!document.getElementById)
		return;
	var img = document.getElementById("ewrptToggleFilterImg");
	var p = document.getElementById("ewrptExtFilterPanel");
	if (!p || !img)
		return;
	if (p.style.display == "") {
		p.style.display = "none";
		if (img.tagName == "IMG")
			img.src = EWRPT_IMAGES_FOLDER + "/expand.gif";
	} else {
		p.style.display = "";
		if (img.tagName == "IMG")
			img.src = EWRPT_IMAGES_FOLDER + "/collapse.gif";
	}
}

// Setup table
function ewrpt_SetupTable(tbl) {
	if (!tbl || !tbl.rows)
		return;
	var r, cnt;	
	cnt = tbl.rows.length;
	if (cnt == 0)
		return;
	for (var i=0; i < cnt; i++) {
		r = tbl.rows[i];
		r.cells[r.cells.length-1].style.borderRight = "0"; // last column
	}
	if (cnt > 0) {
		r = tbl.rows[tbl.rows.length-1]; // last row
		cnt = r.cells.length;
		for (var i=0; i < cnt; i++)
			r.cells[i].style.borderBottom = "0";
	}
}

// Init email dialog
function ewrpt_InitEmailDialog() {
	ewrptEmailDialog = new ewrptWidget.Dialog("ewrptEmailDialog", { visible: false, constraintoviewport: true, hideaftersubmit: false, zIndex: 10000 });
	if (ewrptEmailDialog.body) {
		ewrptEmailDialog._body = ewrptEmailDialog.body.innerHTML;
		ewrptEmailDialog.setBody("");
	}
	ewrptEmailDialog.validate = function() {
		var elm;
		var fobj = this.form;
		elm = fobj.elements["sender"];
		if (elm && !ewrpt_HasValue(elm))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterSenderEmail"));
		if (elm && !ewrpt_CheckEmailList(elm.value, 1))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterProperSenderEmail"));
		elm = fobj.elements["recipient"];
		if (elm && !ewrpt_HasValue(elm))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterRecipientEmail"));
		if (elm && !ewrpt_CheckEmailList(elm.value, EWRPT_MAX_EMAIL_RECIPIENT))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterProperRecipientEmail"));
		elm = fobj.elements["cc"];
		if (elm && !ewrpt_CheckEmailList(elm.value, EWRPT_MAX_EMAIL_RECIPIENT))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterProperCcEmail"));
		elm = fobj.elements["bcc"];
		if (elm && !ewrpt_CheckEmailList(elm.value, EWRPT_MAX_EMAIL_RECIPIENT))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterProperBccEmail"));
		elm = fobj.elements["subject"];
		if (elm && !ewrpt_HasValue(elm))
			return ewrpt_OnError(elm, ewLanguage.Phrase("EnterSubject"));
		return true;
	};
	ewrptEmailDialog.render();
}

// Show dialog for email sending
// argument object members:
// lnk - email link id
// hdr - dialog header
// url - URL of the email script
// f - form
// key - key as object
function ewrpt_EmailDialogShow(oArg) {
	if (!ewrptEmailDialog)
		return;
	if (ewrptEmailDialog.cfg.getProperty("visible"))
		ewrptEmailDialog.hide();

	var cfg = { context: [oArg.lnk, "tl", "bl"], postmethod: "form",
		buttons: [ { text:ewLanguage.Phrase("SendEmailBtn"), handler:ewrpt_DefaultHandleSubmit, isDefault:true },
			{ text:ewLanguage.Phrase("CancelBtn"), handler:ewrpt_DefaultHandleCancel } ]
	};
	if (ewrptEnv.ua.ie && ewrptEnv.ua.ie >= 8)
		cfg["underlay"] = "none";
	ewrptEmailDialog.cfg.applyConfig(cfg);
	ewrptEmailDialog.callback.argument = oArg;
	if (ewrptEmailDialog.header) ewrptEmailDialog.header.style.width = "auto";
	if (ewrptEmailDialog.body) ewrptEmailDialog.body.style.width = "auto";
	if (ewrptEmailDialog.footer) ewrptEmailDialog.footer.style.width = "auto";
	ewrptEmailDialog.setHeader(oArg.hdr);
	ewrptEmailDialog.setBody(ewrptEmailDialog._body);
	ewrptEmailDialog.render();
	ewrptEmailDialog.registerForm(); // make sure the form is registered (otherwise, the form is not registered in the first time)

  //alert(ewrptEmailDialog.form.innerHTML);
	ewrptEmailDialog.show();

}

function ewrpt_DefaultHandleSubmit() {
	this.submit();
}

function ewrpt_DefaultHandleCancel() {
	this.cancel();
	this.setBody("");
}

// ewrpt_Language class
function ewrpt_Language(obj) {
	this.obj = obj;
	this.Phrase = function(id) {
		return this.obj[id.toLowerCase()];
	};
}

ewrpt_URL = function(url) {
	this.scheme = null;
	this.host = null;
	this.port = null;
	this.path = null;
	this.args = {};
	this.anchor = null;
	if (url) {
		this.set(url);
	} else {
		this.set(window.location.href);
	}
}

// parses the current window.location and returns a ewrpt_URL object
ewrpt_URL.thisURL = function() {
	return new ewrpt_URL(window.location.href);
}

ewrpt_URL.prototype = new Object();

// parses an URL
ewrpt_URL.prototype.set = function(url) {
	var p;
	if (p = this.parseURL(url)) {
		this.scheme = p['scheme'];
		this.host = p['host'];
		this.port = p['port'];
		this.path = p['path'];
		this.args = this.parseArgs(p['args']);
		this.anchor = p['anchor'];
	}
}

// remove a specified argument
ewrpt_URL.prototype.removeArg = function(k) {
	if (k && String(k.constructor) == String(Array)) {
		var t = this.args;
		for (var i = 0; i < k.length - 1; i++) {
			if (typeof t[k[i]] != 'undefined') {
				t = t[k[i]];
			} else {
				return false;
			}
		}
		delete t[k[k.length - 1]];
		return true;
	} else if (typeof this.args[k] != 'undefined') {
		delete this.args[k];
		return true;
	}
	return false;
}

// add an argument with specified value
ewrpt_URL.prototype.addArg = function(k, v, o) {
	if (k && String(k.constructor) == String(Array)) {
		var t = this.args;
		for (var i = 0; i < k.length - 1; i++) {
			if (typeof t[k[i]] == 'undefined') t[k[i]] = {};
			t = t[k[i]];
		}
		if (o || typeof t[k[k.length - 1]] == 'undefined') t[k[k.length - 1]] = v;
	} else if (o || typeof this.args[k] == 'undefined') {
		this.args[k] = v;
		return true;
	}
	return false;
}

// parses the specified URL and returns an object
ewrpt_URL.prototype.parseURL = function(url) {
	var p = {}, m;
	if (m = url.match(/((https?):\/\/)?([^\/:]+)?(:([0-9]+))?([^\?#]+)?(\?([^#]+))?(#(.+))?/)) {
		p['scheme'] = (m[2] ? m[2] : 'http');
		p['host'] = (m[3] ? m[3] : window.location.host);
		p['port'] = (m[5] ? m[5] : null);
		p['path'] = (m[6] ? m[6] : null);
		p['args'] = (m[8] ? m[8] : null);
		p['anchor'] = (m[10] ? m[10] : null);
		if (!m[2] && !m[5] && !m[6] && m[3]) { // input is relative URL
			p['path'] = p['host'];
			p['host'] = null;
		}
// var s = ""; // *** debug
// for (i in m)
// s += i + "=" + m[i] + "\n";
// alert(s); 
		return p;
	}
	return false;
}

// parses a query string and returns an object
ewrpt_URL.prototype.parseArgs = function(s) {
	var a = {};
	if (s && s.length) {
		var kp, kv;
		var p;
		if ((kp = s.split('&')) && kp.length) {
			for (var i = 0; i < kp.length; i++) {
				if ((kv = kp[i].split('=')) && kv.length == 2) {
					if (p = kv[0].split(/(\[|\]\[|\])/)) {
						for (var z = 0; z < p.length; z++) {
							if (p[z] == ']' || p[z] == '[' || p[z] == '][') {
								p.splice(z, 1);
							}
						}
						var t = a;
						for (var o = 0; o < p.length - 1; o++) {
							if (typeof t[p[o]] == 'undefined') t[p[o]] = {};
							t = t[p[o]];
						}
						t[p[p.length - 1]] = kv[1];
					} else {
						a[kv[0]] = kv[1];
					}
				}
			}
		}
	}
	return a;
}

// takes an object and returns a query string
ewrpt_URL.prototype.toArgs = function(a, p) {
	if (arguments.length < 2) p = '';
	if (a && typeof a == 'object') {
		var s = '';
		for (i in a) {
			if (typeof a[i] != 'function') {
				if (s.length) s += '&';
				if (typeof a[i] == 'object') {
					var k = (p.length ? p + '[' + i + ']' : i);
					s += this.toArgs(a[i], k);
				} else {
					s += p + (p.length && i != '' ? '[' : '') + i + (p.length && i != '' ? ']' : '') + '=' + a[i];
				}
			}
		}
		return s;
	}
	return '';
}

// returns string containing the absolute URL
ewrpt_URL.prototype.toAbsolute = function() {
	var s = '';
	if (this.scheme != null) s += this.scheme + '://';
	if (this.host != null) s += this.host;
	if (this.port != null) s += ':' + this.port;
	s += this.toRelative();
	return s;
}

// returns a string containing the relative URL
ewrpt_URL.prototype.toRelative = function() {
	var s = '';
	if (this.path != null) s += this.path;
	var a = this.toArgs(this.args);
	if (a.length) s += '?' + a;
	if (this.anchor != null) s += '#' + this.anchor;
	return s;
}

// determine whether the host matches the current host
ewrpt_URL.prototype.isHost = function() {
	var u = ewrpt_URL.thisURL();
	return (this.host == null || this.host == u.host ? true : false);
}

// returns URL
ewrpt_URL.prototype.toString = function() {
	return (this.isHost() ? this.toRelative() : this.toAbsolute());
}