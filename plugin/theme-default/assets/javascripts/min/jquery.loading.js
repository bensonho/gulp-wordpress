(function(){!function(n){"use strict";var i,t;return t="loading",i={init:function(i){var t;return i=n.extend({className:"loading",links:"nav a",text:"loading",loadOnClick:!1,where:"body"},i),t=n(i.where).prepend('<div class="'+i.className+'"><div class="contents"><div class="animation"></div>'+i.text+"</div></div>"),i.loadOnClick&&n(i.links).on("click",function(){return n(".loading").show()}),n(window).on("load",function(){return n(".loading").fadeOut()})}},n.fn.loading=function(e){i[e]?i[e].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof e&&e?n.error("Method "+e+" does not exist on jQuery."+t):i.init.apply(this,arguments)}}(jQuery)}).call(this);