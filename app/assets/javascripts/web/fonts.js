(function () {
  WebFontConfig = {
    google: {
      families: ['Roboto:200,300,400,500,700:latin,cyrillic-ext']
    }
  };

  (function(d) {
    var wf = d.createElement('script'), s = d.scripts[0];
    wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js';
    s.parentNode.insertBefore(wf, s);
  })(document);
})();
