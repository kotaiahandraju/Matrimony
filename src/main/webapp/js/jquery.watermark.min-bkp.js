(function(a){var b=function(g,h){var d=a.extend({},a.fn.watermark.defaults,h),f=false,e=this,i=a(this),c=a(g),b=c.clone();b.insertBefore(c);b.attr("id",b.attr("id")+"_text");b.attr("name",b.attr("name")+"_text");c.css({width:1,height:1,overflow:"hidden",border:0,padding:0,backgroundColor:"transparent",margin:"-18px 0 0 -1px",visibility:"hidden"});c.attr("tabIndex",-1);this.check=function(){if(b.val()==d.watermarkText||b.val()==""){if(b.attr("type").toLowerCase()=="password"&&!f){b.remove();var g=b.wrap("<span>").parent();b=a(g.html().replace(/type=["']?password["']?/i,'type="text"'));b.insertBefore(c);e.initializeHandlers()}else if(c.attr("type").toLowerCase()=="password"&&b.attr("type").toLowerCase()!="password"&&f){b.remove();var g=b.wrap("<span>").parent();if(g.html().toLowerCase().search(/type/i)==-1){b=a(document.createElement(g.html()));b.attr("type","password")}else b=a(g.html().replace(/type=["']?text["']?/i,'type="password"'));b.insertBefore(c);b.focus();b.focus();e.initializeHandlers();return}if(f){b.val("");c.val("");b.removeClass(d.watermarkClassName)}else{b.val(d.watermarkText);c.val("");b.addClass(d.watermarkClassName)}}else c.val(b.val())};c.focus(function(){b.focus()});this.initializeHandlers=function(){b.focus(function(){f=true;e.check()}).blur(function(){f=false;e.check()}).change(function(){f=true;e.check()}).keydown(function(){f=true;e.check()}).keypress(function(){f=true;e.check()}).keyup(function(){f=true;e.check()})};this.val=function(a){if(a||a==""){b.val(a);b.removeClass(d.watermarkClassName);e.check()}a=c.val();return a};this.getWatermarkElement=function(){return b};this.getElement=function(){return c};this.watermarkText=function(a){if(a){b.val()==d.watermarkText&&b.val("");d.watermarkText=a;b.removeClass(d.watermarkClassName);e.check()}a=d.watermarkText;return a};this.watermarkClassName=function(a){if(a){b.removeClass(d.watermarkClassName);d.watermarkClassName=a;e.check()}a=d.watermarkClassName;return a};this.initializeHandlers();this.check()};a.fn.watermark=function(c){return this.filter("input[type=text],input[type=password],input[type=search],input:not([type]),textarea").each(function(){if(a(this).data("watermarkElement"))return a(this).data("watermarkElement");var d=new b(this,c);a(this).data("watermarkElement",d)})};a.fn.watermark.defaults={watermarkText:"",watermarkClassName:"watermark"}})(jQuery)