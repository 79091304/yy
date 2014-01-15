/**
 * 我秀调整页面
 */

var s = {
    w : 0,
    h : 0,
    p : true,
    i : "url",
    a : null,
    u : "http://mm.yue.ifeng.com/woxiu/resize.html",

    reIframe : function (o) {
        this.a = document.getElementById(this.i);
        if (this.a == null) {
            this.a = document.createElement("iframe");
        }
        this.a.id = this.i;
        this.a.width = "0";
        this.a.height = "0";
        this.a.frameborder = "0";
        this.a.src = this.u + "?width=" + o.w + "&height=" + o.h;
        document.body.appendChild(this.a);
    },
    _start : function () {
        if (this.p) {
            setTimeout("s._start()", 300);
        }
        try {
            var w = document.body.clientWidth  || document.documentElement.clientWidth;
            var h = document.body.clientHeight || document.documentElement.clientHeight;
            if (w != null && h != null && (w != this.w || h != this.h)) {
                this.w = w;
                this.h = h;
                this.reIframe({"w": w,"h": h - 0 + 1});
            }
        }catch(e) {}

    }
};
document.onload = s._start();