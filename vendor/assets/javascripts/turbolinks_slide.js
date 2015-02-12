(function() {
  var TurbolinksSlide;

  TurbolinksSlide = (function() {
    function TurbolinksSlide() {
      this.width = $(window).width();
      this.event = null;
      this.curr_url = {
        path: '',
        query: ''
      };
      this.next_url = {
        path: '',
        query: ''
      };
    }

    TurbolinksSlide.prototype.animation_param = function(_event) {
      this.event = _event;
      switch (this._animation_type()) {
        case 1:
          return {
            marginLeft: "-" + this.width + "px",
            marginRight: "" + this.width + "px",
            opacity: 0.5
          };
        case -1:
          return {
            marginLeft: "" + this.width + "px",
            marginRight: "-" + this.width + "px",
            opacity: 0.5
          };
        default:
          return {
            opacity: 0
          };
      }
    };

    TurbolinksSlide.prototype._animation_type = function() {
      this._set_url();
      if (this._is_same_path()) {
        if (this._is_both_have_query_strings()) {
          return this._ufo(this.curr_url.query, this.next_url.query);
        }
        return 0;
      }
      if (this.next_url.path.length > this.curr_url.path.length) {
        if (this.next_url.path.indexOf(this.curr_url.path) >= 0) {
          return 1;
        }
      } else if (this.curr_url.path.length > this.next_url.path.length) {
        if (this.curr_url.path.indexOf(this.next_url.path) >= 0) {
          return -1;
        }
      }
      return 0;
    };

    TurbolinksSlide.prototype._ufo = function(a, b) {
      if (a < b) {
        return 1;
      }
      if (a > b) {
        return -1;
      }
      return 0;
    };

    TurbolinksSlide.prototype._set_url = function() {
      var cq, next_full_url, nq;
      this.curr_url = {
        path: document.location.pathname,
        query: document.location.search.replace('?', '')
      };
      next_full_url = this.event.originalEvent.data.url.replace(document.location.origin, '');
      next_full_url = next_full_url.split('?');
      this.next_url = {
        path: next_full_url[0],
        query: (next_full_url.length > 1 ? next_full_url[1] : '')
      };
      cq = this.curr_url.path.match(/\/[\-0-9]+/g);
      nq = this.next_url.path.match(/\/[\-0-9]+/g);
      if (cq !== '' && nq !== '') {
        if (this.curr_url.path.replace(cq, '') === this.next_url.path.replace(nq, '')) {
          this.curr_url = {
            path: this.curr_url.path.replace(cq, ''),
            query: cq
          };
          this.next_url = {
            path: this.next_url.path.replace(nq, ''),
            query: nq
          };
        }
      }
    };

    TurbolinksSlide.prototype._is_both_have_query_strings = function() {
      return this.curr_url.query !== '' && this.next_url.query !== '';
    };

    TurbolinksSlide.prototype._is_same_path = function() {
      return this.curr_url.path === this.next_url.path;
    };

    return TurbolinksSlide;

  })();

  this.TurbolinksSlide = TurbolinksSlide;

}).call(this);
