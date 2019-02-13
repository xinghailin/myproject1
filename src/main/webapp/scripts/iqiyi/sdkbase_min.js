!
function() {
    var a = window;
    a.Qiyi = a.Qiyi || {},
    a.Q = a.Qiyi,
    a.Q.http = {},
    a.Q.url = {},
    a.Q.object = {},
    a.Q.element = {},
    a.Q.flash = {},
    a.Q.plugins = {},
    a.Q.lang = {},
    a.JSON = a.JSON || {},
    a.JSON.stringify || (a.JSON.stringify = function() {
        function c(a) {
            return /["\\\x00-\x1f]/.test(a) && (a = a.replace(/["\\\x00-\x1f]/g,
            function(a) {
                var c = b[a];
                return c ? c: (c = a.charCodeAt(), "\\u00" + Math.floor(c / 16).toString(16) + (c % 16).toString(16))
            })),
            '"' + a + '"'
        }
        function d(b) {
            var e, f, g, c = ["["],
            d = b.length;
            for (f = 0; d > f; f++) switch (g = b[f], typeof g) {
            case "undefined":
            case "function":
            case "unknown":
                break;
            default:
                e && c.push(","),
                c.push(a.JSON.stringify(g)),
                e = 1
            }
            return c.push("]"),
            c.join("")
        }
        function e(a) {
            return 10 > a ? "0" + a: a
        }
        function f(a) {
            return '"' + a.getFullYear() + "-" + e(a.getMonth() + 1) + "-" + e(a.getDate()) + "T" + e(a.getHours()) + ":" + e(a.getMinutes()) + ":" + e(a.getSeconds()) + '"'
        }
        var b = {
            "\b": "\\b",
            "	": "\\t",
            "\n": "\\n",
            "\f": "\\f",
            "\r": "\\r",
            '"': '\\"',
            "\\": "\\\\"
        };
        return function(b) {
            switch (typeof b) {
            case "undefined":
                return "undefined";
            case "number":
                return isFinite(b) ? String(b) : "null";
            case "string":
                return c(b);
            case "boolean":
                return String(b);
            default:
                if (null === b) return "null";
                if (b instanceof Array) return d(b);
                if (b instanceof Date) return f(b);
                var h, i, e = ["{"],
                g = a.JSON.stringify;
                for (var j in b) if (Object.prototype.hasOwnProperty.call(b, j)) switch (i = b[j], typeof i) {
                case "undefined":
                case "unknown":
                case "function":
                    break;
                default:
                    h && e.push(","),
                    h = 1,
                    e.push(g(j) + ":" + g(i))
                }
                return e.push("}"),
                e.join("")
            }
        }
    } ()),
    a.JSON.parse || (a.JSON.parse = function(a) {
        return new Function("return " + a)()
    }),
    Array.prototype.indexOf || (Array.prototype.indexOf = function(a) {
        var b = this.length,
        c = +arguments[1] || 0;
        if (0 === b || isNaN(c) || c >= b) return - 1;
        for (0 > c && (c = b + c, 0 > c && (c = 0)); b > c; ++c) if (this[c] === a) return c;
        return - 1
    }),
    String.prototype.trim || (String.prototype.trim = function() {
        return this.replace(/^\s\s*/, "").replace(/\s\s*$/, "")
    }),
    Array.isArray = Array.isArray ||
    function(a) {
        return "[object Array]" == Object.prototype.toString.call(a)
    },
    a.Q.__callbacks__ = {},
    function() {
        a.Q.url.escapeSymbol = function(a) {
            return String(a).replace(/[#%&+=\/\\\ \u3000\f\r\n\t]/g,
            function(a) {
                return "%" + (256 + a.charCodeAt()).toString(16).substring(1).toUpperCase()
            })
        },
        a.Q.object.forEach = function(a, b) {
            var c, d, e;
            if ("function" == typeof b) for (d in a) if (a.hasOwnProperty(d) && (e = a[d], c = b.call(a, e, d), c === !1)) break;
            return a
        },
        a.Q.url.jsonToQuery = function(b, c) {
            var e, d = [],
            f = c ||
            function(b) {
                return a.Q.url.escapeSymbol(b)
            };
            return a.Q.object.forEach(b,
            function(a, b) {
                if (Array.isArray(a)) for (e = a.length; e--;) d.push(b + "=" + f(a[e], b));
                else d.push(b + "=" + f(a, b))
            }),
            d.join("&")
        },
        a.Q.url.queryToJson = function(a) {
            for (var g, h, i, j, b = a.substr(a.lastIndexOf("?") + 1), c = b.split("&"), d = c.length, e = {},
            f = 0; d > f; f++) c[f] && (j = c[f].split("="), g = j.shift(), h = j.join("="), i = e[g], "undefined" == typeof i ? e[g] = h: Array.isArray(i) ? i.push(h) : e[g] = [i, h]);
            return e
        },
        a.Q.object.extend = function(a, b, c) {
            c = c ||
            function() {
                return ! 0
            };
            for (var d in b) b.hasOwnProperty(d) && c(a[d], b[d]) && (a[d] = b[d]);
            return a
        },
        a.Q.url.parse = function(a) {
            var b = /(\w+):\/\/([^\/:]+):?(\d*)((?:\/|$)[^?#]*)/,
            c = a.match(b);
            if (c) {
                var d = c[1],
                e = c[2],
                f = c[3],
                g = c[4];
                return {
                    protocol: d,
                    host: e,
                    port: f,
                    path: g
                }
            }
            return null
        },
        a.Q.element.ready = function() {
            function e() {
                if (!a.isReady) {
                    a.isReady = !0;
                    for (var b = 0,
                    d = c.length; d > b; b++) c[b]()
                }
            }
            function f() {
                try {
                    document.documentElement.doScroll("left")
                } catch(a) {
                    return setTimeout(f, 1),
                    void 0
                }
                e()
            }
            function g() {
                if (!b) if (b = !0, "complete" === document.readyState) a.isReady = !0;
                else if (document.addEventListener) document.addEventListener("DOMContentLoaded", d, !1),
                window.addEventListener("load", e, !1);
                else if (document.attachEvent) {
                    document.attachEvent("onreadystatechange", d),
                    window.attachEvent("onload", e);
                    var c = !1;
                    try {
                        c = null == window.frameElement
                    } catch(g) {}
                    document.documentElement.doScroll && c && f()
                }
            }
            var d, a = this,
            b = !1,
            c = [];
            return document.addEventListener ? d = function() {
                document.removeEventListener("DOMContentLoaded", d, !1),
                e()
            }: document.attachEvent && (d = function() {
                "complete" === document.readyState && (document.detachEvent("onreadystatechange", d), e())
            }),
            g(),
            function(b) {
                a.isReady ? b() : c.push(b)
            }
        } (),
        a.Q.element.ready.isReady = !1,
        a.Q.flash.getVer = function() {
            var a;
            try {
                a = navigator.plugins["Shockwave Flash"].description
            } catch(b) {
                try {
                    a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash").GetVariable("$version")
                } catch(b) {}
            }
            return (a || "0 r0").match(/\d+/g)
        } (),
        a.Q.flash.create = function(b, c) {
            var d = {
                id: null,
                height: 1,
                width: 1,
                styles: {},
                properties: {},
                params: {
                    quality: "high",
                    allowScriptAccess: "always",
                    wMode: "window",
                    align: "middle",
                    bgcolor: "#000000",
                    swLiveConnect: "true",
                    loop: "true",
                    play: "true",
                    DeviceFont: "false",
                    allowFullScreen: "true",
                    menu: "true"
                },
                vars: {}
            },
            e = c.id || "swf_" + Date.now().toString(36),
            f = a.Q.object.extend(d.params, c.params || {}),
            g = a.Q.object.extend(d.vars, c.vars || {}),
            h = a.Q.object.extend(d.styles, c.styles || {}),
            i = function() {
                return a.Q.object.extend(d.properties, {
                    height: d.height,
                    width: d.width
                },
                function(a, b) {
                    return b ? !0 : void 0
                }),
                a.Q.object.extend(d.properties, c.properties,
                function(a, b) {
                    return b ? !0 : void 0
                }),
                a.Q.object.extend(d.properties, {
                    height: c.height,
                    width: c.width
                },
                function(a, b) {
                    return b ? !0 : void 0
                })
            } ();
            f.flashVars = a.Q.url.jsonToQuery(g,
            function(a) {
                return a
            }),
            a.Q.browser.IE ? (i.classid = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000", f.movie = b) : i.type = "application/x-shockwave-flash",
            i.data = b;
            var j = [];
            j.push('<object id="', e, '"');
            for (var k in i) j.push(" ", k, '="', i[k], '"');
            j.push(' style="');
            for (var l in h) j.push(l, ":", h[l], ";");
            j.push('"'),
            j.push(">");
            for (var m in f) f[m] && j.push('<param name="', m, '" value="', f[m], '" />');
            return j.push("</object>"),
            j.join("")
        },
        a.Q.flash.list = new
        function() {
            var a = {};
            this.set = function(b) {
                if (b in a) throw "flash对象id有重复！";
                a[b] = document.getElementById(b)
            },
            this.get = function(b) {
                return a[b]
            },
            this.getAll = function() {
                return a
            },
            this.remove = function(b) {
                a[b] = null,
                delete a[b]
            }
        },
        a.Q.flash.insert = function(b, c) {
            c.id = c.id || "swf_" + (1 * new Date).toString(36);
            var d = a.Q.flash.create(b, c),
            e = document.createElement("div");
            e.style.display = "none",
            e.innerHTML = d;
            var f;
            return f = c.container ? c.container[0] : document.body,
            f.insertBefore(e.firstChild, null),
            setTimeout(function() {
                a.Q.flash.list.set(c.id)
            },
            0),
            c.id
        },
        a.Q.plugins.clearSwf = function() {
            var c, d = function() {},
            e = window.location.protocol,
            f = a.Q.url.queryToJson(window.location.search).clear,
            g = (f || e + "//www.iqiyi.com/player/20130922140142/VideoUploader.swf") + "?r=" + Math.floor(2147483648 * Math.random()).toString(36),
            h = {},
            i = !1;
            if ("0" != a.Q.flash.getVer[0]) {
                Q.__callbacks__.iqiyi_clear_ready = function() {
                    i = !0;
                    for (var a; h.ready && h.ready.length;) try {
                        a = h.ready.shift(),
                        a(j())
                    } catch(b) {}
                },
                d = function(a, b) {
                    a = a.replace(/^on/i, ""),
                    a = a.toLowerCase(),
                    h[a] = h[a] || [],
                    c && i ? b(j()) : h[a].push(b)
                },
                a.Q.element.ready(function() {
                    c = a.Q.flash.insert(g, {
                        styles: {
                            position: "absolute",
                            top: "0",
                            left: "0",
                            zIndex: "-999"
                        },
                        params: {
                            bgcolor: "",
                            wMode: "transparent"
                        }
                    })
                });
                var j = function() {
                    return document.getElementById(c)
                };
                return {
                    on: d,
                    notice: function(a) {
                        var b = j();
                        b && b.notice && b.notice(JSON.stringify(a))
                    },
                    get: function() {
                        return j()
                    }
                }
            }
        } (),
        a.Q.lang.isSameDomain = function(b, c) {
            if ("/" == b.charAt(0) || "/" == c.charAt(0)) return ! 0;
            var d = a.Q.url.parse(b),
            e = a.Q.url.parse(c);
            return null == d || null == e ? !0 : e.host == d.host && e.protocol == d.protocol && e.port == d.port
        },
        a.Q.browser = function() {
            var a = {},
            b = navigator.userAgent.toLowerCase();
            navigator.plugins;
            var d = b.match(/(ipad).*os\s([\d_]+)/),
            e = !d && b.match(/(iphone\sos)\s([\d_]+)/),
            f = b.match(/(Android)\s+([\d.]+)/);
            a.IE = /msie/.test(b),
            a.OPERA = /opera/.test(b),
            a.MOZ = /gecko/.test(b),
            a.IE6 = /msie 6/.test(b),
            a.IE7 = /msie 7/.test(b),
            a.IE8 = /msie 8/.test(b),
            a.IE9 = /msie 9/.test(b),
            a.SAFARI = /safari/.test(b) && !/chrome/.test(b),
            a.mobileSafari = (/iPhone/i.test(navigator.platform) || /iPod/i.test(navigator.platform) || /iPad/i.test(navigator.userAgent)) && !!navigator.appVersion.match(/(?:Version\/)([\w\._]+)/),
            a.WEBKIT = /webkit/.test(b),
            a.CHROME = /chrome/.test(b),
            a.iPhone = /iphone os/.test(b),
            a.iPod = /iPod/i.test(b),
            a.android = /android/.test(b),
            a.iPhone4 = /iphone os [45]_/.test(b),
            a.iPad = /ipad/.test(b),
            a.WP = /windows phone/.test(b),
            a.baidu = /baidu/.test(b),
            a.mbaidu = /baidu/.test(b),
            a.m360 = /360/.test(b),
            a.muc = /uc/.test(b),
            a.mqq = /qq/.test(b),
            f && (a.version = f[2]),
            e && (a.ios = !0, a.version = e[2].replace(/_/g, ".")),
            d && (a.ios = !0, a.version = d[2].replace(/_/g, ".")),
            a.iPod && (a.ios = !0),
            a.lePad = /lepad_hls/.test(b),
            a.Mac = /macintosh/.test(b),
            a.TT = /tencenttraveler/.test(b),
            a.$360 = /360se/.test(b),
            a.ff = /firefox/.test(b),
            a.uc = /uc/.test(b),
            a.Maxthon = !1;
            try {
                a.html5Video = !!document.createElement("video").play
            } catch(g) {
                a.html5Video = !1
            }
            try {
                var h = window.external;
                a.Maxthon = h.max_version ? !0 : !1
            } catch(g) {}
            return a
        } (),
        a.Q.http.swfp = function(b, c) {
            var d = "window.Q.__callbacks__.",
            e = "iqiyi__swfp__" + Math.floor(2147483648 * Math.random()).toString(36);
            c = c || {},
            c.onsuccess = c.onsuccess ||
            function() {},
            c.onfailure = c.onfailure ||
            function() {},
            c.ontimeout = c.ontimeout ||
            function() {},
            a.Q.__callbacks__[e] = function(b) {
                "A00001" == b ? c.ontimeout() : "A00002" == b ? c.onfailure() : c.onsuccess({
                    responseText: b
                },
                b),
                delete a.Q.__callbacks__[e]
            },
            setTimeout(function() {
                a.Q.plugins.clearSwf.notice({
                    type: "remote",
                    data: {
                        url: b,
                        method: c.method || "GET",
                        timeout: c.timeout || 0,
                        param: c.data || {},
                        callback: d + e
                    }
                })
            },
            0)
        },
        a.Q.http.swfp.request = function() {
            var a = arguments;
            Q.plugins.clearSwf.on("ready",
            function() {
                Q.http.swfp.apply(null, a)
            })
        },
        a.Q.http.json2 = function(b, c) {
            var d = function(b, c) {
                return a.Q.lang.isSameDomain(b, document.location.href) ? a.Q.Utils.ajax.request(b, c) : a.Q.browser.IE6 || a.Q.browser.IE7 || a.Q.browser.IE8 || a.Q.browser.IE9 ? a.Q.http.swfp.request(b, c) : (c.withCredentials !== !1 && (c.withCredentials = !0), a.Q.Utils.ajax.request(b, c))
            };
            if (c) {
                var e = c.onsuccess;
                c.onsuccess = function(a, b) {
                    var b = b.trim(),
                    c = null;
                    b = b.replace(/^[^\[\{]*([\[\{].*[\]\}]).*?$/, "$1");
                    try {
                        c = JSON.parse(b)
                    } catch(d) {}
                    if (!c) try {
                        c = new Function("return (" + b + ")")()
                    } catch(d) {}
                    e && e(a, c)
                }
            }
            d(b, c)
        }
    } (),
    Q.Utils = {},
    Q.Utils.parseData = function(a) {
        var b = null;
        a = a.replace(/^[^\[\{]*([\[\{].*[\]\}]).*?$/, "$1");
        try {
            b = JSON.parse(a)
        } catch(c) {}
        if (!b) try {
            b = new Function("return (" + a + ")")()
        } catch(c) {}
        return b
    },
    Q.Utils.errorHandler = function(a) {
        a = a || {};
        var b = null;
        if (a.data) {
            if (a.data.code) return a.data;
            var c = a.data.responseText ? a.data.responseText.trim() : "";
            b = Q.Utils.parseData(c),
            b || (b = {
                msg: a.msg ? a.msg: "server error",
                code: "E00000",
                data: {}
            })
        } else b = {
            msg: a.msg ? a.msg: "unknown error",
            code: "E00000",
            data: {}
        };
        return b
    },
    Q.Utils.formReq = {
        request: function(a, b) {
            function q() {
                if (4 == m.readyState) {
                    var b;
                    try {
                        b = m.status
                    } catch(c) {
                        return console.log && console.log(c),
                        s("failure"),
                        void 0
                    }
                    if (s(b), b >= 200 && 300 > b || 304 == b || 1223 == b || 0 === b) {
                        if (0 === b) try {
                            console.log && console.log(a + " 本地响应成功, resp: ")
                        } catch(d) {}
                        s("success")
                    } else s("failure");
                    window.setTimeout(function() {
                        m && (m.onreadystatechange = function() {}),
                        e && (m = null, delete m)
                    },
                    0)
                }
            }
            function r() {
                if (window.XMLHttpRequest) return new XMLHttpRequest;
                if (window.ActiveXObject) try {
                    return new window.ActiveXObject("Msxml2.XMLHTTP")
                } catch(a) {
                    try {
                        return new window.ActiveXObject("Microsoft.XMLHTTP")
                    } catch(b) {}
                }
            }
            function s(a) {
                a = "on" + a;
                var b = j[a];
                if (b) {
                    if (k && window.clearTimeout(k), "onsuccess" !== a) b(m);
                    else {
                        var c;
                        try {
                            c = m.responseText
                        } catch(d) {
                            return console.log && console.log(d),
                            b(m)
                        }
                        b(m, m.responseText)
                    }
                    return ! 0
                }
                return ! 1
            }
            function t(a, b) {
                j["on" + a] && b.addEventListener(a, j["on" + a].bind(this, m), !1)
            }
            b = b || {};
            var k, l, m, n, c = b.data || "",
            d = b.dataType,
            e = b.async !== !1,
            f = (b.method || "POST").toUpperCase(),
            g = b.headers || {},
            h = b.params || {},
            i = b.timeout || 0,
            j = {},
            p = b.withCredentials || !1;
            for (l in b) j[l] = b[l];
            try {
                m = r(),
                n = m.upload || m;
                var u = new FormData;
                e && (m.onreadystatechange = q);
                for (l in h) u.append(l, h[l]);
                m.open(f, a, e),
                "file" == d && c.key && c.file && (u.append(c.key, c.file), t("progress", n), t("error", m));
                for (l in g) g.hasOwnProperty(l) && m.setRequestHeader(l, g[l]);
                "withCredentials" in m && (m.withCredentials = p),
                s("beforerequest"),
                i && (k = setTimeout(function() {
                    m && (m.onreadystatechange = function() {},
                    console.log && console.log(a + " timeout"), m.abort(), s("timeout") || s("failure"))
                },
                i)),
                m.send(u),
                u = null,
                c = null,
                b.data = null,
                e || q()
            } catch(v) {
                console.log && console.log(v),
                s("failure")
            }
            return m
        }
    },
    Q.Utils.ajax = {
        request: function(a, b) {
            function o() {
                if (4 == m.readyState) {
                    var b;
                    try {
                        b = m.status
                    } catch(c) {
                        return console.log && console.log(c),
                        q("failure"),
                        void 0
                    }
                    if (q(b), b >= 200 && 300 > b || 304 == b || 1223 == b || 0 === b) {
                        if (0 === b) try {
                            console.log && console.log(a + " 本地响应成功, resp: " + m.responseText + ", withCredentials: " + m.withCredentials)
                        } catch(e) {}
                        q("success")
                    } else console.log && console.log(b),
                    q("failure");
                    window.setTimeout(function() {
                        m && (m.onreadystatechange = function() {}),
                        d && (m = null, delete m)
                    },
                    0)
                }
            }
            function p() {
                if (window.XMLHttpRequest) return new XMLHttpRequest;
                if (window.ActiveXObject) try {
                    return new window.ActiveXObject("Msxml2.XMLHTTP")
                } catch(a) {
                    try {
                        return new window.ActiveXObject("Microsoft.XMLHTTP")
                    } catch(b) {}
                }
            }
            function q(a) {
                a = "on" + a;
                var b = j[a];
                if (b) {
                    if (k && window.clearTimeout(k), "onsuccess" !== a) b(m);
                    else {
                        var c;
                        try {
                            c = m.responseText
                        } catch(d) {
                            return console.log && console.log(d),
                            b(m)
                        }
                        b(m, m.responseText)
                    }
                    return ! 0
                }
                return ! 1
            }
            b = b || {};
            var k, l, m, c = b.data || "",
            d = b.async !== !1,
            e = b.username || "",
            f = b.password || "",
            g = (b.method || "GET").toUpperCase(),
            h = b.headers || {},
            i = b.timeout || 0,
            j = {},
            n = b.withCredentials || !1;
            for (l in b) j[l] = b[l];
            try {
                m = p(),
                "[object Object]" == Object.prototype.toString.call(c) && (c = Q.url.jsonToQuery(c)),
                "GET" == g && (c && (a += (a.indexOf("?") >= 0 ? "&": "?") + c, c = null), b.noCache && (a += (a.indexOf("?") >= 0 ? "&": "?") + "b" + +new Date + "=1")),
                e ? m.open(g, a, d, e, f) : m.open(g, a, d),
                d && (m.onreadystatechange = o),
                "POST" == g && m.setRequestHeader("Content-Type", h["Content-Type"] || "application/x-www-form-urlencoded");
                for (l in h) h.hasOwnProperty(l) && m.setRequestHeader(l, h[l]);
                "withCredentials" in m && (m.withCredentials = n),
                q("beforerequest"),
                i && (k = setTimeout(function() {
                    m && (m.onreadystatechange = function() {},
                    console.log && console.log(a + " timeout"), m.abort(), q("timeout") || q("failure"))
                },
                i)),
                m.send(c),
                c = null,
                b.data = null,
                d || o()
            } catch(r) {
                console.log && console.log(r),
                q("failure")
            }
            return m
        }
    },
    Q.Utils.support = function() {
        var a = window.navigator.userAgent.toLowerCase(),
        b = /(webkit)[ \/]([\w.]+)/.exec(a) || /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(a) || /(msie) ([\w.]+)/.exec(a) || !/compatible/.test(a) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(a) || [],
        c = b[1] || "",
        d = parseFloat(b[2]) || 0,
        e = "msie" == c && d > 5 || "opera" == c && d >= 9 || "mozilla" == c && d > 1.7 || "webkit" == c && d > 523;
        if ("msie" == c && 9 > d) try {
            fileInput.style.display = "none",
            document.appendChild(fileInput),
            fileInput.filters,
            document.removeChild(fileInput),
            fileInput = null
        } catch(g) {
            e = !1
        }
        var h = "msie" == c,
        i = Q.browser.IE6 || Q.browser.IE7 || Q.browser.IE8 || Q.browser.IE9,
        j = "swf",
        k = "";
        if (!i) try {
            var l = new Blob;
            l.slice || l.mozSlice || l.webkitSlice ? (j = "stream", k = l.slice ? "slice": l.mozSlice ? "mozSlice": "webkitSlice") : j = window.FormData ? "form": "swf"
        } catch(m) {
            j = window.FormData ? "form": "swf"
        }
        return {
            isSkinnable: e,
            noH5: i,
            uploadMethod: j,
            sliceName: k,
            isIE: h
        }
    } (),
    Q.Utils.LS = function() {
        var a = {},
        b = {
            getItem: function(b) {
                return a[b]
            },
            setItem: function(b, c) {
                a[b] = c
            },
            removeItem: function(b) {
                delete a[b]
            }
        },
        c = function() {
            try {
                return window.localStorage.setItem("_Q_test_", 1),
                window.localStorage.removeItem("_Q_test_"),
                window.localStorage
            } catch(a) {}
            return b
        } ();
        return {
            getStorage: function() {
                return c
            },
            read: function(a, b) {
                var d = c.getItem(a);
                if (d) try {
                    d = JSON.parse(d)
                } catch(e) {}
                return b ? (b(null, d), void 0) : d
            },
            write: function(a, b, d) {
                "string" == typeof b ? c.setItem(a, value) : c.setItem(a, JSON.stringify(b)),
                d && d()
            },
            remove: function(a, b) {
                c.removeItem(a),
                b && b()
            }
        }
    } ();
    var b = 1024,
    c = function(a) {
        this._opt = a || {},
        this.maxSize = a.maxSize,
        this.allowFileTypes = ["mpg", "mpeg", "mp4", "m4v", "flv", "f4v", "mkv", "avi", "rm", "rmvb", "wmv", "mov", "ts", "vob", "wm", ".asf", ".rm", ".ram", ".mpe", ".dat", ".3gp", ".mp4v", ".mkv"],
        this._init(this._opt),
        this._initUrl(this._opt)
    };
    c.prototype = {
        _init: function(a) {
            this.type = a.type || "openapi",
            this._opt = a,
            this.uploader = null,
            Q.Utils.support.noH5 ? this.uploader = new e(a) : (this._addType(a.allowType), this.uploader = new f(a)),
            this.file_id = "",
            this.handler = a.handler || {}
        },
        _initUrl: function(a) {
            this.url = a.url,
            this.requestUrl = "meizi" === a.type ? this.url + "msupload": this.url + "openupload",
            this.finishUrl = "uploadfinish",
            this.cancelUrl = "cancelupload"
        },
        _addType: function(a) {
            if (a) for (var b = 0; b < a.length; b++) this.allowFileTypes.indexOf(a[b]) && this.allowFileTypes.push(a[b])
        },
        resetBtn: function(a) {
            a = a || {};
            var b = Q.plugins.clearSwf.get();
            b && (a.btnW && (b.style.width = a.btnW), a.btnH && (b.style.height = a.btnH), a.btnT && (b.style.top = a.btnT), a.btnL && (b.style.left = a.btnL), a.btnZ && (b.style.zIndex = a.btnZ))
        },
        initOneFile: function(a) {
            if (this.uploader.handler = this.handler, this._opt.needMeta || (this.hasMeta = !0), Q.Utils.support.noH5) this.resetBtn(a),
            this.uploader.request({
                param: {
                    access_token: this._opt.access_token,
                    device_id: this._opt.device_id || "qipa",
                    role: "openapi",
                    btnH: a.btnH,
                    btnW: a.btnW
                },
                url: this.requestUrl
            });
            else {
                var c = document.getElementById("qiyifileupload");
                if (!c.files || 0 == c.files.length) return;
                this.requestOneFile(c, a)
            }
        },
        requestOneFile: function(a, b) {
            b = b || {};
            var d, c = this;
            this.uploader.handler = this.handler,
            this.uploader.currentFile = a.files[0];
            var e = this._getFileType(a.files[0].name);
            return this.maxSize && a.files[0].size > this.maxSize ? (d = {
                code: "C00002",
                msg: "file too big"
            },
            b.onError ? b.onError(d) : this.uploader.handler.onError && this.uploader.handler.onError(d), void 0) : ( - 1 == this.allowFileTypes.indexOf(e) ? (d = {
                code: "C00001",
                msg: "file type error"
            },
            b.onError ? b.onError(d) : this.uploader.handler.onError && this.uploader.handler.onError(d)) : (this.uploader.localFile = {
                token: c._opt.access_token
            },
            c.uploader.request({
                headers: {
                    access_token: c._opt.access_token,
                    device_id: c._opt.device_id || "openapi",
                    role: "openapi",
                    filesize: "" + a.files[0].size,
                    filetype: e
                },
                onSuccess: b.onSuccess || null,
                onError: b.onError || null,
                requestUrl: c.requestUrl
            })), void 0)
        },
        startUpload: function(a, b) {
            a.upload_url && (this.upload_url_host = Q.url.parse(a.upload_url).protocol + "://" + Q.url.parse(a.upload_url).host),
            a.file_id && (this.file_id = a.file_id),
            this.uploader && this.uploader.start(a, b)
        },
        pauseUpload: function(a) {
            this.uploader && this.uploader.pause && this.uploader.pause(a)
        },
        resumeUpload: function(a, b) {
            this.uploader && this.uploader.resume && this.uploader.resume(a, b)
        },
        finishUpload: function(a) {
            var b = {};
            b.url = this.url + this.finishUrl,
            b.headers = {
                access_token: this._opt.access_token,
                file_id: this.file_id,
                range_finished: !0
            },
            this.uploader && this.uploader.finish && this.uploader.finish(b, a)
        },
        cancelUpload: function(a) {
            var b = {};
            this.uploader && (b.url = this.cancelUrl, b.host = this.url, b.headers = {
                access_token: this._opt.access_token,
                file_id: this.file_id,
                status: 2
            },
            this.uploader.cancel(b, a))
        },
        clearData: function() {
            this.uploader = null,
            this.file_id = "",
            this.handler = null
        },
        _getFileType: function(a) {
            if (null != a) {
                var b = a.lastIndexOf(".") + 1,
                c = a.substring(b);
                return c.toLowerCase()
            }
            return ""
        },
        getFileType: function(a) {
            return this._getFileType(a)
        },
        delLocal: function(a, b) {
            var c = this;
            this.uploader && this.uploader.getLocal(a,
            function(d, e) {
                e && e.token === c._opt.access_token && e.info.file_id === b && Q.Utils.LS.remove(a)
            })
        }
    };
    var d = function(a) {
        a = a || {},
        this._init(a)
    };
    d.prototype = {
        _init: function(a) {
            this._version = "2.0.0517",
            this.host = a.url
        },
        getAuthBaidu: function(a, b) {
            this._request("baidu", a, b)
        },
        getAuthPerson: function(a, b) {
            this._request("person", a, b)
        },
        getAuthEnterprise: function(a, b) {
            this._request("ent", a, b)
        },
        refreshToken: function(a, b) {
            this._request("refresh", a, b)
        },
        setMetadata: function(a, b) {
            this._request("meta", a, b)
        },
        delVideoById: function(a, b) {
            this._request("del", a, b)
        },
        getVideoListPage: function(a, b) {
            this._request("page", a, b)
        },
        getVideoInfo: function(a, b) {
            this._request("info", a, b)
        },
        getVideoListPageExternal: function(a, b) {
            this._request("pageExternal", a, b)
        },
        getVideoInfoExternal: function(a, b) {
            this._request("infoExternal", a, b)
        },
        getVideoCount: function(a, b) {
            this._request("count", a, b)
        },
        getFileStatus: function(a, b) {
            this._request("fullStatus", a, b)
        },
        getSDKVersion: function() {
            return this._version
        },
        _request: function(a, b, c) {
            b = b || {};
            var d = "";
            switch (a) {
            case "baidu":
                d = this.host + "api/baidu/authorize";
                break;
            case "ent":
                d = this.host + "api/enterprise/authorize";
                break;
            case "person":
                d = this.host + "api/person/authorize";
                break;
            case "del":
                d = this.host + "api/file/delete";
                break;
            case "count":
                d = this.host + "api/file/count";
                break;
            case "info":
                d = this.host + "api/file/fetchvideolist";
                break;
            case "page":
                d = this.host + "api/file/fetchvideolist";
                break;
            case "infoExternal":
                d = this.host + "api/file/videoListForExternal";
                break;
            case "pageExternal":
                d = this.host + "api/file/videoListForExternal";
                break;
            case "meta":
                d = this.host + "api/file/info";
                break;
            case "refresh":
                d = this.host + "api/oauth2/token";
                break;
            case "fullStatus":
                d = this.host + "api/file/fullStatus"
            }
            b.cb = "vcop__" + (new Date).getTime() + a,
            Q.http.json2(d, this._buildParam(b, c))
        },
        _buildParam: function(a, b) {
            var c = {};
            return c.data = a,
            c.withCredentials = !1,
            c.onsuccess = function(a, c) {
                c || (c = Q.Utils.errorHandler()),
                b && b(c)
            },
            c.onfailure = function(a) {
                a = Q.Utils.errorHandler({
                    data: a
                }),
                b && b(a)
            },
            c
        }
    },
    Q.vcopClient = function(a) {
        a = a || {},
        this._init(a),
        this.exec(a)
    },
    Q.vcopClient.prototype = {
        _init: function(a) {
            this._opt = a || {},
            this._opt.redirectUrl = a.redirectUrl || window.location.href,
            this._opt.appKey = a.appKey || "",
            this._opt.appSecret = a.appSecret || "",
            this._opt.managerUrl = a.managerUrl || "https://openapi.iqiyi.com/",
            this._opt.uploadUrl = a.uploadUrl || "http://qichuan.iqiyi.com/",
            this._opt.uploadBtn = a.uploadBtn || {
                dom: null,
                btnH: "1px",
                btnW: "1px",
                btnT: "0px",
                btnL: "0px",
                hasBind: !1
            },
            this._opt.uploadBtn.hasBind = !(this._opt.uploadBtn.hasBind !== !0),
            this._opt.needMeta = !(a.needMeta !== !1),
            this.authtoken = "",
            this.manager = null,
            this.multi = !(a.multi !== !0),
            this.onlyFile = null,
            this.allowFileTypes = ["*"]
        },
        getProperties: function() {
            return this._opt
        },
        exec: function() {
            this.manager = new d({
                url: this._opt.managerUrl
            }),
            this.multi || this._preparePage()
        },
        _preparePage: function() {
            if (!document.getElementById("qiyidivfile")) {
                var a = document.createElement("div");
                a.id = "qiyidivfile",
                a.style.left = "-999999px",
                a.style.position = "absolute",
                a.innerHTML = '<input id="qiyifileupload" type="file" />',
                document.body.insertBefore(a, null),
                this._buildEvent()
            }
        },
        _buildEvent: function() {
            var a = this;
            if (this.upfile = document.getElementById("qiyifileupload"), this._opt.uploadBtn && this._opt.uploadBtn.dom && !this._opt.uploadBtn.hasBind) {
                if (Q.Utils.support.noH5) {
                    var b = {
                        btnH: a._opt.uploadBtn.btnH,
                        btnW: a._opt.uploadBtn.btnW,
                        uploadBtn: a._opt.uploadBtn.dom,
                        btnT: a._opt.uploadBtn.btnT,
                        btnL: a._opt.uploadBtn.btnL,
                        btnZ: a._opt.uploadBtn.btnZ
                    };
                    this._opt.uploadBtn.dom.attachEvent ? this._opt.uploadBtn.dom.attachEvent("onclick",
                    function() {
                        a.authtoken && a.onlyFile && a.onlyFile.initOneFile(b)
                    }) : this._opt.uploadBtn.dom.addEventListener("click",
                    function() {
                        a.authtoken && a.onlyFile && a.onlyFile.initOneFile(b)
                    })
                } else this.upfile && (this._clearFiles(this.upfile), this._opt.uploadBtn.dom.addEventListener("click",
                function() {
                    a.authtoken && a.upfile.click()
                },
                !1), this._buildFileEvent());
                this._opt.uploadBtn.hasBind = !0
            } else this._clearFiles(this.upfile)
        },
        _buildFileEvent: function() {
            var a = this;
            this.upfile && this._clearFiles(this.upfile),
            this.accept = this.allowFileTypes.join(","),
            this.upfile.addEventListener("change",
            function() {
                a.onlyFile && a.onlyFile.initOneFile()
            },
            !1)
        },
        _clearFiles: function(a) {
            a = a || document.getElementById("qiyifileupload"),
            a.files && a.files.length > 0 && (a.files = null, a.value = "", Q.browser.IE && (a.type = "text", a.type = "file"))
        },
        initUpload: function(a, b) {
        	var fileName     =  document.getElementById("fileName");
        	var description  =  document.getElementById("description");
        	if (fileName.value!=''&&description.value!='') {
        		 a = a || {},
                 this.multi || this._clearFiles(),
                 a.type = a.type || "openapi",
                 a.url = this._opt.uploadUrl,
                 a.access_token = this.authtoken,
                 a.handler = b,
                 a.uploadBtn = this._opt.uploadBtn;
                 var d = null;
                 return d = new c(a),
                 this.multi || (this.onlyFile = d),
                 d
			}else{
				if (fileName.value=='') {
					fileName.style.border="1px solid red";
				}
				if (description.value==''){
					description.style.border="1px solid red";
				}
			}
           
        },
        resetApiUrl: function(a) {
            this._opt.managerUrl = a,
            this.manager && (this.manager.url = a)
        },
        getAuthNormal: function() {
            var a = this._opt.managerUrl + "api/oauth2/authorize?client_id=" + this._opt.appKey + "&response_type=token&redirect_uri=" + this._opt.redirectUrl,
            b = window.open(a, "newwindow", "height=500,width=600,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=yes, status=no");
            b || alert("请允许弹窗验证窗体")
        },
        getAuthBaidu: function(a, b) {
            a = a || {},
            a.client_id = a.client_id || this._opt.appKey,
            this.manager.getAuthBaidu(a, b)
        },
        getAuthPerson: function(a, b) {
            a = a || {},
            a.client_id = this._opt.appKey,
            a.client_secret = this._opt.appSecret,
            this.manager.getAuthPerson(a, b)
        },
        getAuthEnterprise: function(a) {
            var b = {};
            b.client_id = '5de2a851aba444b184f6b95393940729', //this._opt.appKey,   //修改Key
            b.client_secret = 'a54f59019e208e11608a0c546e2a3bb1',
            this.manager.getAuthEnterprise(b, a)
        },
        refreshToken: function(a, b) {
            a = a || {},
            a.client_id = this._opt.appKey,
            a.client_secret = this._opt.appSecret,
            this.manager.refreshToken(a, b)
        },
        setMetadata: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            a.uploader && this.manager.setMetadata({
                access_token: a.access_token,
                file_id: a.file_id,
                file_name: a.file_name,
                description: a.description,
                tag: a.tag,
                need_final_page: 0 === a.need_final_page ? 0 : 1
            },
            function(c) {
                "A00000" === c.code && (a.uploader.hasMeta = !0),
                b(c)
            }) 
        },
        delVideoById: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            a.delete_type = 1,
            this.manager.delVideoById(a, b)
        },
        getVideoListPage: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            a.internal ? this.manager.getVideoListPage(a, b) : this.manager.getVideoListPageExternal(a, b)
        },
        getVideoInfo: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            a.internal ? this.manager.getVideoInfo(a, b) : this.manager.getVideoInfoExternal(a, b)
        },
        getVideoCount: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            this.manager.getVideoCount(a, b)
        },
        getFileStatus: function(a, b) {
            a = a || {},
            a.access_token = a.access_token || this.authtoken,
            this.manager.getFileStatus(a, b)
        },
        getSDKVersion: function() {
            return this.manager.getSDKVersion()
        },
        resetBtn: function(a) {
            a && a.uploadBtn && (a.uploadBtn.dom === this._opt.uploadBtn.dom && (a.uploadBtn.hasBind = !0), this._opt.uploadBtn = a.uploadBtn, this._buildEvent())
        }
    };
    var e = function(a) {
        a = a || {},
        this._init(a)
    };
    e.prototype = {
        _init: function(a) {
            this.startTime = 0,
            this.timer = null,
            this.readyTimer = null,
            this.ready = !1,
            this.ns = "window.Q.__callbacks__.",
            this.handler = a.handler,
            a.uploadBtn ? this.perUpload({
                btnW: a.width || "62px",
                btn: a.height || "32px"
            }) : this.perUpload(a.uploadBtn)
        },
        perUpload: function() {
            var b = this;
            this.clearData(),
            this.readyTimer = setTimeout(function() {
                Q.plugins.clearSwf.on("ready",
                function() {
                    b.ready = !0
                })
            },
            10)
        },
        start: function(a, b) {
            var c = this;
            this.clearData();
            var d = "iqiyi__upload__" + (new Date).getTime();
            a = a || {};
            var e = d + "__upload";
            this.startTime = (new Date).getTime(),
            this.timer = setInterval(function() {
                var d = Q.plugins.clearSwf.get().notice(JSON.stringify({
                    type: "progress",
                    data: {
                        param: {
                            file_id: a.file_id
                        }
                    }
                }));
                if (d) {
                    var e = JSON.parse(d);
                    e && c.drawProgressFlash(e.data.byteLoaded / 1024, e.data.byteTotal / 1024, b)
                }
            },
            300),
            Q.__callbacks__[e] = function(b) {
                var c = JSON.parse(b);
                "A00001" == c.code ? a.handler.onError() && a.handler.onError(c) : a.handler.onFinish && a.handler.onFinish(c),
                delete __callbacks__[e]
            },
            Q.plugins.clearSwf.notice({
                type: "upload",
                data: {
                    url: a.upload_url,
                    param: {
                        file_id: a.file_id
                    },
                    callback: this.ns + e
                }
            })
        },
        request: function(a) {
            var b = this,
            c = "iqiyi__upload__" + (new Date).getTime();
            a = a || {};
            var d = c + "__request";
            Q.__callbacks__[d] = function(a) {
                var c = JSON.parse(a);
                "A00001" == c.code ? b.handler && b.handler.onError(c) : b.handler && b.handler.onSuccess(c),
                delete __callbacks__[d]
            },
            Q.plugins.clearSwf.notice({
                type: "request",
                data: {
                    url: a.url,
                    param: a.param,
                    callback: this.ns + d
                }
            })
        },
        cancel: function(a, b) {
            this.clearData();
            var c = "iqiyi__upload__" + (new Date).getTime();
            a = a || {};
            var d = c + "__cancel";
            Q.__callbacks__[d] = function(a) {
                var c = JSON.parse(a);
                "A00001" == c.code ? b.onError() && b.onError(c) : (b.onSuccess() && b.onSuccess(c), _this.clearData()),
                delete __callbacks__[d]
            },
            Q.plugins.clearSwf.notice({
                type: "cancel",
                data: {
                    url: a.url,
                    param: {
                        file_id: a.file_id,
                        status: 2
                    },
                    callback: this.ns + d
                }
            })
        },
        drawProgressFlash: function(a, b, c) {
            var d = a / b,
            e = b - a,
            f = Math.floor(100 * d),
            g = a / (((new Date).getTime() - this.startTime) / 1e3);
            c.onProgress && c.onProgress({
                percent: f,
                speed: g,
                remainTime: e / g,
                finished: a,
                total: b
            }),
            f >= 100 && 1 / 0 > f && (this.timer && c.onFinish && c.onFinish({
                manualFinish: !1
            }), this.clearData())
        },
        clearData: function() {
            this._clearTimer(),
            this.startTime = 0
        },
        _clearTimer: function() {
            this.timer && (clearInterval(this.timer), this.timer = null),
            this.readyTimer && (clearTimeout(this.readyTimer), this.readyTimer = null)
        }
    };
    var f = function(a) {
        a = a || {},
        this._init(a)
    };
    f.prototype = {
        _init: function(a) {
            this.testInfo = a.testInfo || {
                testNum: 2,
                testUnit: 64 * b
            },
            this.policyInfo = a.policyInfo || {
                chunkNum: 1,
                fluct: .7,
                maxSize: Q.Utils.support.isIE ? b * b: 10 * b * b,
                timeout: 2e4
            },
            this._initEvent(),
            this.localFileList = null,
            this.localname = "uploadlist",
            this.getLocalFileList()
        },
        _initEvent: function() {
            this.eventHandlers = {},
            this.eventHandlers.ontestEnd = this._verify.bind(this),
            this.eventHandlers.onspeedUpdate = this.drawProgress.bind(this)
        },
        _initJob: function() {
            this.job = {
                testArr: [],
                chunkArr: [],
                finishSize: 0,
                testJob: {
                    finishNum: 0,
                    speedArr: [],
                    infoArr: []
                },
                realJob: {
                    speedArr: []
                },
                tasklist: {
                    length: 0
                }
            },
            this.status = {
                timeoutCount: 0,
                errorCount: 0
            },
            this.fileInfo = null,
            this.currentSize = this.testInfo.testUnit,
            this.minSize = this.testInfo.testNum * this.testInfo.testUnit
        },
        _getFromLocal: function() {
            var a = this,
            b = {
                info: this.fileInfo,
                chunkArr: [],
                md5: [],
                tm: (new Date).getTime(),
                token: a.localFile.token
            };
            this.getLocal(this.currentFile.name,
            function(c, d) {
                d && d.token === a.localFile.token && d.info.file_size === a.currentFile.size ? a.localFile.data = d: (a.localFile.exist = !1, a.localFile.data = b),
                a._divideTest()
            })
        },
        _doRequestHandler: function() {
            this.updateLocal(),
            this.job.handler && this.job.handler.onSuccess ? this.job.handler.onSuccess({
                data: this.fileInfo
            }) : this.handler && this.handler.onSuccess && this.handler.onSuccess({
                data: this.fileInfo
            })
        },
        _divideTest: function() {
            for (var a = 0,
            b = 0,
            c = 0,
            d = null; a < this.testInfo.testNum; a++) b = this.testInfo.testUnit * a,
            c = b + this.testInfo.testUnit,
            d = this._divide(this.currentFile, b, c),
            this.job.testArr.push(d);
            this._startTest()
        },
        _startTest: function() {
            for (; this.job.testArr.length > 0;) this._uploadFormDataBuffer(this.job.testArr.shift(), {
                onprogress: function() {}.bind(this),
                onsuccess: this._testSuccessHandler,
                onfailure: this._bufferErrorHandler,
                ontimeout: this._bufferTimeoutHandler
            },
            null)
        },
        _verify: function() {
            var a = this,
            b = !0;
            this.job.testJob.infoArr.forEach(function(c) {
                a.localFile.data.md5.indexOf(c.range_md5) < 0 && (b = !1)
            }),
            b ? (a.localFile.exist = !0, this.fileInfo = a.localFile.data.info) : (this.job.testJob.infoArr.forEach(function(b, c) {
                a.localFile.data.md5[c] = b.range_md5
            }), a.localFile.exist = !1, a.localFile.data.info = this.fileInfo),
            this._doRequestHandler()
        },
        _chunk: function() {
            var a = this.localFile.exist ? this.localFile.data.chunkArr.length: this.policyInfo.chunkNum;
            a = a || this.policyInfo.chunkNum;
            var b = this.testInfo.testUnit * this.testInfo.testNum;
            this.testInfo.testSize = b;
            var c = parseInt((this.currentFile.size - b) / a),
            d = 0,
            e = 0,
            f = 0,
            g = null;
            if (! (d >= this.currentFile.size)) for (var h = this.localFile.data && this.localFile.data.chunkArr.length > 0 ? this.localFile.data.chunkArr: null; a > d; d++) {
                e = d * c + b,
                f = d === a - 1 ? this.currentFile.size: e + c;
                var i = h ? h[d].range.match(/\d+/gi)[1] : null;
                i = i ? parseInt(i, 10) + 1 : 0,
                i = 0 === i ? e: i,
                g = this.currentFile[Q.Utils.support.sliceName](e, f),
                this.job.chunkArr.push({
                    buff: g,
                    osp: e,
                    sp: i,
                    ep: f
                }),
                h || this.localFile.exist || this._updateLocalInfo({
                    chunkArr: {
                        range: e + "-" + e
                    }
                })
            }
        },
        _divide: function(a, b, c, d) {
            var e = c - 1,
            f = c,
            g = d ? a.size + d: a.size;
            c >= g && (f = g, e = g - 1);
            var h = null;
            return h = d ? a[Q.Utils.support.sliceName](b - d, f - d) : a[Q.Utils.support.sliceName](b, f),
            {
                data: h,
                range: "" + b + "-" + e,
                realend: e,
                nextStart: f,
                thisStart: b
            }
        },
        _realStart: function() {
            this._chunk(),
            this.localFile.exist && this.breakPoint();
            for (var a = 0; this.job && a < this.job.chunkArr.length; a++) this._nextBuff(a)
        },
        _nextBuff: function(a) {
            var c, b = this.job.chunkArr[a].osp;
            if (! (this.job.chunkArr[a].sp >= this.job.chunkArr[a].ep)) {
                c = 0 === this.currentSize ? this.testInfo.testUnit: this.currentSize > this.policyInfo.maxSize ? this.policyInfo.maxSize: this.currentSize;
                var d = this._divide(this.job.chunkArr[a].buff, this.job.chunkArr[a].sp, c + this.job.chunkArr[a].sp, b);
                this.job.chunkArr[a].sp = d.nextStart,
                this._uploadFormDataBuffer(d, {
                    onprogress: this._buffProgressHandler,
                    onsuccess: this._buffSuccessHandler,
                    onfailure: this._bufferErrorHandler,
                    ontimeout: this._bufferTimeoutHandler
                },
                a)
            }
        },
        _uploadFormDataBuffer: function(a, b, c) {
            if (this.fileInfo) {
                var d = (new Date).getTime(),
                e = {
                    st: d,
                    pst: d,
                    loaded: 0,
                    size: a.data.size,
                    range: a.range,
                    index: c,
                    buff: a,
                    handler: b
                },
                f = {
                    dataType: "file",
                    data: {
                        key: "file",
                        file: a.data
                    },
                    params: {
                        file_id: this.fileInfo.file_id,
                        file_size: this.fileInfo.file_size,
                        range: a.range
                    },
                    onprogress: b.onprogress.bind(this, e),
                    onsuccess: b.onsuccess.bind(this, e),
                    onfailure: b.onfailure.bind(this, e, b, c),
                    ontimeout: b.ontimeout.bind(this, e, b, c)
                },
                g = a.thisStart;
                this.setTaskList(g, a, !0),
                Q.Utils.formReq.request(this.fileInfo.upload_url + "?t=" + d, f)
            }
        },
        _speedMeasure: function(a) {
            0 === this.job[a + "Job"].speedArr.length % 2 && (this._decision(this.job[a + "Job"].speedArr), "real" === a ? (this.job[a + "Job"].speedArr.length = 0, this.fire("speedUpdate")) : this.fire("testEnd"))
        },
        _decision: function(a) {
            var d, e, c = 0;
            e = Math.max.apply(Math, a),
            a.forEach(function(b, d) {
                b === e && a.length > 2 ? (delete a[d], a.length--) : c += b
            }),
            d = c / a.length * b,
            d > this.currentSize * (1 + this.policyInfo.fluct) && this.currentSize > 0 && (d = this.currentSize * (2 - this.policyInfo.fluct)),
            this.currentSize = Math.ceil(d)
        },
        _doFinish: function(a) {
            a >= 100 && 1 / 0 > a && this.job.handler.onFinish && this.job.handler.onFinish({
                manualFinish: !0,
                file_id: this.fileInfo.file_id
            })
        },
        _bufferErrorHandler: function(a, b, c) {
            if (this.job.finishSize = this.job.finishSize - a.loaded, this.status.errorCount += 1, this.status.errorCount < 5) this._doDelay(this.status.errorCount, a.buff, b, c);
            else {
                var d = Q.Utils.errorHandler(d);
                this.job.handler && this.job.handler.onError ? this.job.handler.onError(d) : this.handler.onError && this.handler.onError(d),
                this.clearAllData()
            }
        },
        _bufferTimeoutHandler: function(a) {
            if (this.job.finishSize = this.job.finishSize - a.loaded, this.status.timeoutCount += 1, this.status.timeoutCount < 10) this._doDelay(this.status.timeoutCount, a.buff, a.handler, a.index, null);
            else {
                var b = Q.Utils.errorHandler(b);
                this.job.handler && this.job.handler.onError ? this.job.handler.onError(b) : this.handler.onError && this.handler.onError(b),
                this.clearAllData()
            }
        },
        _testSuccessHandler: function(a, c) {
            if (0 === c.status) return this._bufferTimeoutHandler(a),
            void 0;
            var d = c.responseText ? c.responseText.trim() : "";
            d = Q.Utils.parseData(d),
            this.clearStatus(),
            a.et = (new Date).getTime(),
            this.job.finishSize += a.size,
            this.job.testJob.infoArr.push(d),
            this.job.testJob.speedArr.push(a.size / b / ((a.et - a.st) / 1e3));
            var e = a.thisStart;
            this.setTaskList(e, null, !1),
            a = null,
            this._speedMeasure("test")
        },
        _updateLocalInfo: function(a, b) {
            if ("cancel" !== this.isGo) {
                var c = this.localFile.data;
                if ("object" == typeof a) for (var d in a) c[d] instanceof Array ? void 0 !== b && void 0 !== c[d][b] ? c[d][b] = a[d] : c[d].push(a[d]) : c[d] = a[d];
                this.saveLocal(this.currentFile.name, c)
            }
        },
        _buffProgressHandler: function(a, c, d) {
            var g, h, i, e = (new Date).getTime(),
            f = 0;
            g = e - a.pst,
            h = e - this.job.sp,
            d.loaded > a.size ? 0 === a.loaded ? f = a.size: f += a.size - a.loaded: f = d.loaded - a.loaded,
            this.job.finishSize += f,
            a.loaded = a.loaded += f,
            g > 0 && (a.pst = e, i = f / b / (g / 1e3), this.job.realJob.speedArr.push(i)),
            h > 300 && (this.job.sp = e, this._speedMeasure("real"))
        },
        _buffSuccessHandler: function(a, b) {
            if (0 === b.status) return this._bufferTimeoutHandler(a),
            void 0;
            this.clearStatus(),
            this._updateLocalInfo({
                chunkArr: {
                    range: a.range
                }
            },
            a.index);
            var c = this.drawProgress(),
            d = a.thisStart;
            return this.setTaskList(d, null, !1),
            this.job.finishSize === this.currentFile.size ? (a = null, this._doFinish(c), void 0) : (this.isGo === !0 && (this._nextBuff(a.index), a = null), void 0)
        },
        _doDelay: function(a, b, c, d, e) {
            e = e || 1e3 * Math.pow(2, a),
            this.currentSize = Math.floor(this.policyInfo.fluct / a * (this.currentSize / (1e3 * a))),
            this.currentSize = 0 === this.currentSize ? this.testInfo.testUnit: this.currentSize,
            this.drawProgress();
            var f = this;
            setTimeout(function() {
                f._uploadFormDataBuffer(b, c, d)
            },
            e)
        },
        _formDataSuccessHandler: function() {
            var a = this.drawProgress();
            this._doFinish(a)
        },
        _formDataProgressHandler: function(a, c) {
            var d = c.loaded - this.job.finishSize;
            this.job.finishSize = c.loaded;
            var f, e = c.timeStamp - this.job.sp;
            e > 100 && (this.job.sp = c.timeStamp, f = d / b / (e / 1e3), this.job.realJob.speedArr.push(f), this._speedMeasure("real"))
        },
        _startFormUpload: function() {
            var a = {
                dataType: "file",
                data: {
                    key: "file",
                    file: this.currentFile
                },
                params: {
                    file_id: this.fileInfo.file_id,
                    file_size: this.fileInfo.file_size,
                    range: "0-" + (this.fileInfo.file_size - 1)
                },
                onprogress: this._formDataProgressHandler.bind(this),
                onsuccess: this._formDataSuccessHandler.bind(this),
                onfailure: this.job.handler.onfailure
            };
            Q.Utils.formReq.request(this.fileInfo.upload_url, a)
        },
        getLocalFileList: function() {
            var a = this;
            Q.Utils.LS.read(this.localname,
            function(b, c) {
                a.localFileList = c || []
            })
        },
        setTaskList: function(a, b, c) {
            c ? (this.job.tasklist[a] = b, this.job.tasklist.length++) : (this.job.tasklist[a] = null, delete this.job.tasklist[a], this.job.tasklist.length--)
        },
        setLocalFileList: function() {
            Q.Utils.LS.write(this.localname, this.localFileList)
        },
        saveLocal: function(a, b) {
            Q.Utils.LS.write(a, b)
        },
        getLocal: function(a, b) {
            Q.Utils.LS.read(a, b)
        },
        updateLocal: function(a, b) {
            if (a) {
                var c = this.localFileList.indexOf(a);
                this.localFileList.splice(c, c + 1)
            } else this.localFileList.length > 10 && (a = this.localFileList.shift());
            a && Q.Utils.LS.remove(a),
            this.saveLocal(this.localname, this.localFileList),
            b !== !0 && this.saveLocal(this.currentFile.name, this.localFile.data)
        },
        request: function(a) {
            a = a || {};
            var b = this,
            c = {};
            c.headers = a.headers,
            c.onsuccess = function(c, d) {
                d && "A00000" == d.code ? (d.data.file_size = b.currentFile.size, d.data.file_name = b.currentFile.name, b._initJob(), b.fileInfo = d.data, "stream" === Q.Utils.support.uploadMethod && b.currentFile.size > b.minSize ? (b.localFileList.indexOf(b.currentFile.name) < 0 && b.localFileList.push(b.currentFile.name), b.job.handler = {
                    onSuccess: a.onSuccess
                },
                b._getFromLocal()) : a.onSuccess ? a.onSuccess(d) : b.handler && b.handler.onSuccess && b.handler.onSuccess(d)) : (d || (d = Q.Utils.errorHandler(d)), a.onError ? a.onError(d) : b.handler && b.handler.onError && b.handler.onError(d))
            },
            c.onfailure = function(a, c) {
                c = {},
                a.onError ? a.onError(c) : b.handler && b.handler.onError && b.handler.onError(c)
            },
            c.withCredentials = !1,
            Q.http.json2(a.requestUrl, c)
        },
        start: function(a, b) {
            this.isGo = !0,
            this.job.handler = b,
            this.job.sp = (new Date).getTime(),
            "stream" === Q.Utils.support.uploadMethod && this.currentFile.size > this.minSize ? this._realStart() : this._startFormUpload(a, b)
        },
        breakPoint: function() {
            var a = 0;
            this.job.chunkArr.forEach(function(b) {
                a += b.sp - b.osp
            }),
            a = 0 > a ? 0 : a,
            this.job.finishSize = a + this.testInfo.testSize,
            this.job.finishSize === this.currentFile.size && (this.drawProgress(), this.job.handler.onFinish({
                code: "A00000",
                msg: "重复文件上传",
                manualFinish: !0
            }), this.clearAllData())
        },
        pause: function() {
            this.isGo = "pause"
        },
        resume: function() {
            if (this.isGo !== !0 && (this.clearStatus(), this.isGo = !0, this.job && this.job.chunkArr)) for (var a = 0; a < this.job.chunkArr.length; a++) this._nextBuff(a)
        },
        cancel: function(a, b) {
            var c = this;
            a = a || {},
            this.isGo = "cancel";
            var d = {
                data: a.headers,
                withCredentials: !1
            };
            d.onsuccess = function(a, d) {
                d && "A00000" === d.code ? b && b.onSuccess && b.onSuccess(d) : (d = Q.Utils.errorHandler({
                    data: d,
                    msg: d.msg
                }), b.onError && b.onError(d)),
                c.currentFile && (c.updateLocal(c.currentFile.name, !0), c.clearAllData())
            },
            d.onfailure = function(a) {
                a = Q.Utils.errorHandler({
                    data: a
                }),
                b && b.onError && b.onError(a)
            },
            Q.http.json2(a.host + a.url, d)
        },
        finish: function(a, b) {
            var c = this;
            a = a || {};
            var d = {
                data: a.headers,
                withCredentials: !1
            };
            d.onsuccess = function(a, d) { ! d || "A00000" != d.code && "A00012" != d.code ? (d = Q.Utils.errorHandler({
                    data: d
                }), b && b.onError && b.onError(d)) : b && b.onSuccess && b.onSuccess(d),
                c.clearAllData()
            },
            d.onfailure = function(a) {
                a = Q.Utils.errorHandler({
                    data: a
                }),
                b && b.onError && b.onError(a),
                c.clearAllData()
            },
            Q.http.json2(a.url, d)
        },
        drawProgress: function(a) {
            a = a || this.currentSize / b,
            this.job.finishSize > this.currentFile.size && (this.job.finishSize = this.currentFile.size);
            var c = (100 * (this.job.finishSize / this.currentFile.size)).toFixed(2),
            d = (this.currentFile.size - this.job.finishSize) / b;
            return this.job.handler.onProgress && this.job.handler.onProgress({
                file_id: this.fileInfo.file_id,
                percent: c,
                speed: a,
                remainTime: d / a,
                finished: this.job.finishSize / b,
                total: this.currentFile.size / b
            }),
            c
        },
        clearStatus: function() {
            this.status = {
                timeoutCount: 0,
                errorCount: 0
            }
        },
        clearAllData: function() {
            var a = this;
            this.timer && (clearTimeout(this.timer), this.timer = null),
            this.job && this.job.tasklist && 0 === this.job.tasklist.length ? (this.job = null, this.fileInfo = null, this.currentFile = null, this.handler = null, this.clearStatus()) : this.timer = setTimeout(function() {
                a.clearAllData()
            },
            600)
        },
        fire: function(a) {
            a = "on" + a;
            var b = this.eventHandlers[a];
            return b ? (b(), void 0) : !1
        }
    }
} ();