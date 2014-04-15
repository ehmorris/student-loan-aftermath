"function"!=typeof Object.create&&(Object.create=function(e){function n(){}return n.prototype=e,new n}),/*!
 * jQuery panelSnap
 * Version 0.12.0
 *
 * Requires:
 * - jQuery 1.7 or higher (no jQuery.migrate needed)
 *
 * https://github.com/guidobouman/jquery-panelsnap
 *
 * Copyright 2013, Guido Bouman
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Date: Wed Feb 13 16:05:00 2013 +0100
 */
function(e,n,t){var o="panelSnap",i="plugin_"+o,a={isMouseDown:!1,isSnapping:!1,enabled:!0,scrollInterval:0,scrollOffset:0,init:function(n,o){var i=this;if(i.container=o,i.$container=e(o),i.$eventContainer=i.$container,i.$snapContainer=i.$container,i.$container.is("body")){i.$eventContainer=e(t),i.$snapContainer=e(t.documentElement);var a=navigator.userAgent;~a.indexOf("WebKit")&&(i.$snapContainer=e("body"))}if(i.scrollInterval=i.$container.height(),i.options=e.extend(!0,{},e.fn.panelSnap.options,n),i.bind(),i.options.$menu!==!1&&e(".active",i.options.$menu).length>0)e(".active",i.options.$menu).click();else{var s=i.getPanel(":first");i.activatePanel(s)}return i},bind:function(){var t=this;t.bindProxied(t.$eventContainer,"scrollstop",t.scrollStop),t.bindProxied(t.$eventContainer,"mousewheel",t.mouseWheel),t.bindProxied(t.$eventContainer,"mousedown",t.mouseDown),t.bindProxied(t.$eventContainer,"mouseup",t.mouseUp),t.bindProxied(e(n),"resizestop",t.resize),t.options.keyboardNavigation.enabled&&t.bindProxied(e(n),"keydown",t.keyDown,t.$eventContainer),t.options.$menu!==!1&&t.bindProxied(e(t.options.$menu),"click",t.captureMenuClick,t.options.menuSelector)},bindProxied:function(n,t,o,i){var a=this;i="string"==typeof i?i:null,n.on(t+a.options.namespace,i,e.proxy(function(e){return o.call(a,e)},a))},destroy:function(){var t=this;t.$eventContainer.off(t.options.namespace),e(n).off(t.options.namespace),t.options.$menu!==!1&&e(t.options.menuSelector,t.options.$menu).off(t.options.namespace),t.$container.removeData(i)},scrollStop:function(e){var n=this;if(e.stopPropagation(),n.enabled){if(n.isMouseDown)return n.$eventContainer.one("mouseup"+n.options.namespace,n.scrollStop),void 0;if(!n.isSnapping){var t,o=n.$snapContainer.scrollTop(),i=o-n.scrollOffset,a=n.$container[0].scrollHeight-n.scrollInterval,s=n.getPanel().length;t=i<-n.options.directionThreshold&&i>-n.scrollInterval?Math.floor(o/n.scrollInterval):i>n.options.directionThreshold&&i<n.scrollInterval?Math.ceil(o/n.scrollInterval):Math.round(o/n.scrollInterval),t=Math.max(0,Math.min(t,s));var r=n.getPanel(":eq("+t+")");0===i||(0>=o||o>=a?(n.activatePanel(r),n.scrollOffset=0>o?0:a):n.snapToPanel(r))}}},mouseWheel:function(){var e=this;e.$container.stop(!0),e.isSnapping=!1},mouseDown:function(){var e=this;e.isMouseDown=!0},mouseUp:function(e){var n=this;n.isMouseDown=!1,n.scrollOffset!==n.$snapContainer.scrollTop()&&n.scrollStop(e)},keyDown:function(e){var n=this,t=n.options.keyboardNavigation;if(n.isSnapping){if(e.which==t.previousPanelKey||e.which==t.nextPanelKey)return e.preventDefault(),!1}else switch(e.which){case t.previousPanelKey:e.preventDefault(),n.snapTo("prev",t.wrapAround);break;case t.nextPanelKey:e.preventDefault(),n.snapTo("next",t.wrapAround)}},resize:function(){var e=this;if(e.scrollInterval=e.$container.height(),e.enabled){var n=e.getPanel(".active");e.snapToPanel(n)}},captureMenuClick:function(n){var t=this,o=e(n.currentTarget).data("panel"),i=t.getPanel('[data-panel="'+o+'"]');return t.snapToPanel(i),!1},snapToPanel:function(e){var n=this;if(e instanceof jQuery){n.isSnapping=!0,n.options.onSnapStart.call(n,e),n.$container.trigger("panelsnap:start",[e]);var t=0;t=n.$container.is("body")?e.offset().top:n.$snapContainer.scrollTop()+e.position().top,n.$snapContainer.stop(!0).animate({scrollTop:t},n.options.slideSpeed,function(){n.scrollOffset=t,n.isSnapping=!1,n.options.onSnapFinish.call(n,e),n.$container.trigger("panelsnap:finish",[e])}),n.activatePanel(e)}},activatePanel:function(n){var t=this;if(t.getPanel(".active").removeClass("active"),n.addClass("active"),t.options.$menu!==!1){var o="> "+t.options.menuSelector+".active";e(o,t.options.$menu).removeClass("active");var i='[data-panel="'+n.data("panel")+'"]',a="> "+t.options.menuSelector+i,s=e(a,t.options.$menu);s.addClass("active")}t.options.onActivate.call(t,n),t.$container.trigger("panelsnap:activate",[n])},getPanel:function(n){var t=this;"undefined"==typeof n&&(n="");var o="> "+t.options.panelSelector+n;return e(o,t.$container)},snapTo:function(e,n){var t=this;"boolean"!=typeof n&&(n=!0);var o;switch(e){case"prev":o=t.getPanel(".active").prev(t.options.panelSelector),o.length<1&&n&&(o=t.getPanel(":last"));break;case"next":o=t.getPanel(".active").next(t.options.panelSelector),o.length<1&&n&&(o=t.getPanel(":first"));break;case"first":o=t.getPanel(":first");break;case"last":o=t.getPanel(":last")}o.length>0&&t.snapToPanel(o)},enable:function(){var e=this;e.scrollOffset=e.$snapContainer.scrollTop(),e.enabled=!0},disable:function(){var e=this;e.enabled=!1},toggle:function(){var e=this;e.enabled?e.disable():e.enable()}};e.fn[o]=function(n){var t=Array.prototype.slice.call(arguments);return this.each(function(){var o=e.data(this,i);if("object"!=typeof n&&"init"!==n&&n){if(!o)return e.error("Plugin is not initialized for this object yet."),void 0;if(!o[n])return e.error("Method "+n+" does not exist on jQuery.panelSnap."),void 0;var s=n;n=t.slice(1),o[s].apply(o,n)}else{if(o)return e.error("Plugin is already initialized for this object."),void 0;"init"===n&&(n=t[1]||{}),o=Object.create(a).init(n,this),e.data(this,i,o)}})},e.fn[o].options={$menu:!1,menuSelector:"a",panelSelector:"section",namespace:".panelSnap",onSnapStart:function(){},onSnapFinish:function(){},onActivate:function(){},directionThreshold:50,slideSpeed:200,keyboardNavigation:{enabled:!1,nextPanelKey:40,previousPanelKey:38,wrapAround:!0}}}(jQuery,window,document),/*!
 * Special flavoured jQuery Mobile scrollstart & scrollstop events.
 * Version 0.1.3
 *
 * Requires:
 * - jQuery 1.7.1 or higher (no jQuery.migrate needed)
 *
 * Copyright 2013, Guido Bouman
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Date: Wed Feb 13 16:05:00 2013 +0100
 */
function(e){e.event.special.scrollstart={enabled:!0,setup:function(){function n(e,n){e.type=n?"scrollstart":"scrollstop",i.trigger(e)}var t,o=this,i=e(o);i.data("scrollwatch",!0),i.on("touchmove scroll",function(o){e.event.special.scrollstart.enabled&&(e.event.special.scrollstart.scrolling||(e.event.special.scrollstart.scrolling=!0,n(o,!0)),clearTimeout(t),t=setTimeout(function(){e.event.special.scrollstart.scrolling=!1,n(o,!1)},50))})}},e.event.special.scrollstop={setup:function(){var n=this,t=e(n);t.data("scrollwatch")||e(this).on("scrollstart",function(){})}}}(jQuery),/*!
 * Resizestart and resizestop events.
 * Version 0.0.1
 *
 * Requires:
 * - jQuery 1.7.1 or higher (no jQuery.migrate needed)
 *
 * Copyright 2013, Guido Bouman
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Date: Fri Oct 25 15:05:00 2013 +0100
 */
function(e){e.event.special.resizestart={enabled:!0,setup:function(){function n(e,n){e.type=n?"resizestart":"resizestop",i.trigger(e)}var t,o=this,i=e(o);i.data("resizewatch",!0),i.on("resize",function(o){e.event.special.resizestart.enabled&&(e.event.special.resizestart.resizing||(e.event.special.resizestart.resizing=!0,n(o,!0)),clearTimeout(t),t=setTimeout(function(){e.event.special.resizestart.resizing=!1,n(o,!1)},200))})}},e.event.special.resizestop={setup:function(){var n=this,t=e(n);t.data("resizewatch")||e(this).on("resizestart",function(){})}}}(jQuery),/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 *
 * Requires: 1.2.2+
 */
function(e){function n(n){var t=n||window.event,o=[].slice.call(arguments,1),i=0,a=0,s=0;return n=e.event.fix(t),n.type="mousewheel",t.wheelDelta&&(i=t.wheelDelta/120),t.detail&&(i=-t.detail/3),s=i,void 0!==t.axis&&t.axis===t.HORIZONTAL_AXIS&&(s=0,a=-1*i),void 0!==t.wheelDeltaY&&(s=t.wheelDeltaY/120),void 0!==t.wheelDeltaX&&(a=-1*t.wheelDeltaX/120),o.unshift(n,i,a,s),(e.event.dispatch||e.event.handle).apply(this,o)}var t=["DOMMouseScroll","mousewheel"];if(e.event.fixHooks)for(var o=t.length;o;)e.event.fixHooks[t[--o]]=e.event.mouseHooks;e.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var e=t.length;e;)this.addEventListener(t[--e],n,!1);else this.onmousewheel=n},teardown:function(){if(this.removeEventListener)for(var e=t.length;e;)this.removeEventListener(t[--e],n,!1);else this.onmousewheel=null}},e.fn.extend({mousewheel:function(e){return e?this.bind("mousewheel",e):this.trigger("mousewheel")},unmousewheel:function(e){return this.unbind("mousewheel",e)}})}(jQuery);