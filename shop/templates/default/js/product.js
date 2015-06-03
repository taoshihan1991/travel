/*! uzai - v0.1.11 - 2015-05 */
function scrollEvent() {
    $(window).scroll(function() {
        _productNav.unitScroll(),
        _routeTab.unitScroll(),
        _zyxSideOrder.unitScroll()
    })
}
function popMod(a, b) {
    var c = $("#" + a);
    null == c.get(0) && (c = $("." + a));
    var d = c.parent();
    d.children(".mask").height(document.body.clientHeight),
    d.show().siblings(".pop-mod").hide(),
    c.show(),
    c.find(".pop-close").on("click",
    function() {
        d.hide(),
        c.hide()
    }),
    $(window).on("scroll",
    function() {
        fixIe6(a, b)
    })
}
function fixIe6(a, b) {
    var c = $("#" + a);
    null == c.get(0) && (c = $("." + a)),
    _util.check.isIE6 && c.css("top", $(document).scrollTop() + b)
}
function askPop() {
    $("#j_btnAsking").on("click",
    function() {
        var a = 50,
        b = [];
        b.push("<div class='pop-mod' id='j_askPopMod'>"),
        b.push("<div id='pop-asking' class='pop-asking'>"),
        b.push("<dl class='pop-asking-inner'>"),
        b.push("<dt class='pop-asking-hd pb10 clearfix'><em class='f18 yahei fl'>我要咨询</em><a href='javascript:void(0);' class='pop-close fr lh1 mt5'>&times;</a></dt>"),
        b.push("<dd class='pop-asking-bd'>"),
        b.push("<p class='cont-item'><label for='phone' class='item-hd f14'>联系电话</label><input type='text' id='phone' class='phone f999 p5'><span class='errorInfo' style='color: Red; text-align: left;'></span></p>"),
        b.push("<div class='cont-item'>"),
        b.push("<p><label for='askCont' class='item-hd f14'>咨询内容</label><textarea id='askCont' class='txta f999 p5 j_txtA'></textarea></p>"),
        b.push("<div class='cont-item-r'>"),
        b.push("<p><input type='checkbox' id='mailInform' class='vm mr5'><label for='mailInform' class='f999'>问题解决后邮件通知您</label></p>"),
        b.push("<p class='mt10 hide' id='j_contactEMail'><label for='email' class='item-hd f14'>联系邮箱</label><input type='text' id='email' class='email p5'></p>"),
        b.push("</div>"),
        b.push("</div>"),
        b.push("<p class='cont-item tc'><a id='submitMsg' onclick='productFeedBack();' class='btn-submit white f18 yahei tc mt15'>提&nbsp;&nbsp;&nbsp;&nbsp;交</a></p>"),
        b.push("</dd>"),
        b.push("</dl>"),
        b.push("</div>"),
        b.push("<div class='mask'>&nbsp;</div>"),
        b.push("</div>"),
        $("body").append(b.join("")),
        popMod("pop-asking", a),
        fixIe6("pop-asking", a),
        $("#mailInform").on("change",
        function() {
            var a = $("#j_contactEMail");
            a.hasClass("hide") ? (a.removeClass("hide"), a.addClass("show")) : (a.addClass("hide"), a.removeClass("show"))
        }),
        $("#j_askPopMod").find(".pop-close").on("click",
        function() {
            $("#j_askPopMod").remove()
        })
    })
}
function productTips() {
    $(".J_powerFloat").powerFloat({
        reverseSharp: !0
    }),
    $(".J_powerFloatqijia").powerFloat({
        reverseSharp: !0,
        position: "7-5"
    })
}
function productTab() {
    var a = $("#j_comboPicTab"),
    b = function(a, b) {
        var c = a.children(".hd");
        null == c.get(0) && (c = a.children().children(".hd")),
        c.find("li").on("click",
        function() {
            var a = $(this),
            c = a.siblings("li"),
            d = a.index();
            c.removeClass("on"),
            a.addClass("on");
            var e = a.parents(".hd").siblings(".bd"),
            f = e.children(".item");
            f.hide(),
            f.eq(d).show(),
            b && b(d)
        })
    };
    b($("#j_productInfoTab, #j_hotelTab, #j_picTypeTab")),
    b(a,
    function(b) {
        var c = a.find(".bd").find(".item"),
        d = c.eq(b).find(".combo-pic-list").find("img"),
        e = d.eq(0);
        e.attr("data-original") != e.attr("src") && d.each(function() {
            var a = $(this),
            b = a.attr("data-original");
            b != a.attr("src") && a.attr("src", b)
        })
    })
}

function productComment() {
    var a = $("#j_commentList"),
    b = $("#j_photoComment"),
    c = $.trim($("#j_comCount").text()),
    d = ($.trim($("#j_comPicCount").text()), $("#pid").val()),
    e = 8,
    f = 0,
    g = 0;
    if (c.indexOf(",") > -1 ? (f = parseInt(c.split(",")[0]), g = parseInt(c.split(",")[1])) : f = parseInt(c), 0 != f) {
        b.prop("checked", !1);
        var h = location.href.toLowerCase();
        if (! (h.indexOf("/temai-") > -1 || h.indexOf("temaihui.html") > -1)) {
            var i = $(".important-info");
            if (null != i.get(0)) {
                var j = i.offset().top,
                k = !1;
                $(window).on("scroll",
                function() {
                    if (!k) {
                        var b = a.find(".comment-item").length;
                        if (! (b > 0)) {
                            var c = $(window).scrollTop();
                            c >= j && (k = !0, l())
                        }
                    }
                });
                var l = function() {
                    b.on("change",
                    function() {
                        var a = $(this),
                        b = a.prop("checked");
                        b ? h(g, e, 1) : h(f, e, 0)
                    });
                    var c = function(b, c, f) {
                        var g = f || 0,
                        h = $.ajax({
                            url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=0&pid=" + d + "&pageSize=" + e + "&more=" + g + "&indexPage=" + b,
                            type: "GET",
                            dataType: "jsonp",
                            contentType: "application/json; charset=utf-8"
                        });
                        h.done(function(b) {
                            if (b) {
                                for (var c = b.data,
                                e = [], f = 0; f < c.length; f++) {
                                    var g = c[f],
                                    h = g.id,
                                    i = g.talkbackcontent,
                                    j = (g.UsrSatisfactionLevel, g.UsrSatisfactionRate),
                                    k = g.CommentImages,
                                    l = [];
                                    k && (l = k.split("^")); {
                                        var m = (g.Ucoins, g.num, g.userName),
                                        n = (g.goDate, g.UsrComentWay),
                                        o = g.type,
                                        p = (g.UserGrade, g.UsrSatisfactionStar, g.UserGradePic, g.ReturnDate);
                                        g.Reply
                                    }
                                    if (e.push("<li class='comment-item clearfix'>"), e.push("<div class='member-info fl'>"), e.push("<p class='member-name f14 tc'>" + m + "</p>"), e.push("</div>"), e.push("<div class='comment-side fr'><p class='f999 tc'>" + p + "</p><p class='comment-type mt5'>" + n + "</p></div>"), e.push("<dl class='comment-main'>"), e.push("<dt>"), e.push("<span class='cacsi-bar vm'><span class='progress' style='width:" + j + "'>&nbsp;</span><em class='text-box pl10'>满意度：<b>" + j + "</b></em></span>"), e.push("<span class='cacsi-items vm'>" + o + "</span>"), e.push("</dt>"), e.push("<dd class='f666 lh2 pt10' data-tid='" + h + "'>"), e.push("<p><a target='_blank' href='http://" + _ug.city + ".uzai.com/dianping/" + d + "-" + h + ".html'>" + i + "</a></p>"), l.length > 0) {
                                        e.push("<div class='photo-gallery mt10'>");
                                        for (var q = 0; q < l.length; q++) {
                                            var r = l[q].split("#");
                                            if (r.length > 0) {
                                                var s = r[0],
                                                t = r[1],
                                                u = r[2],
                                                v = r[3];
                                                e.push("<div class='item'><img data-hit='" + v + "'  data-id='" + s + "' alt='" + u + "' src='http://r.uzaicdn.com/picPhone.aspx?file=" + t + "&h=170&t=2' ></div>")
                                            }
                                        }
                                        e.push("</div>")
                                    }
                                    e.push("</dd>"),
                                    e.push("</dl>"),
                                    e.push("</li>")
                                }
                                e && e.length > 0 && (a.find(".comment-list").html(e.join("")), picCommentControl())
                            }
                        })
                    },
                    h = function(a, b, d) {
                        $("#hjPager").uzPager({
                            pageSize: b,
                            pageItems: a,
                            targetLazyload: !0,
                            targetLazyTag: "data-src",
                            onInit: function(a) {
                                c(1, a, d)
                            },
                            onCallback: function(a, b) {
                                productLazy("j_commentList"),
                                skipPoint("travel-comment"),
                                c(a, b, d)
                            }
                        })
                    };
                    h(f, e, 0),
                    productZixun()
                };
                commentPop()
            }
        }
    }
}
function picCommentControl() {
    var a, b, c, d;
    $("#j_commentList").find(".photo-gallery").children(".item").on("click",
    function() {
        var a = $(this);
        d = a.parent(".photo-gallery").parent("dd").attr("data-tid"),
        f(a),
        g(a),
        h(a),
        i(a),
        picShareFix(a),
        j(a)
    });
    var e = function(b) {
        $("#j_replyBox").find(".item").hide(),
        $("#j_replyBox").find(".item").eq(b).show();
        var d = c.find("a.on").attr("data-hit");
        a.find(".btn-praise").find("em.vm").text(d)
    },
    f = function(d) {
        var f = d.index(),
        g = d.find("img"),
        h = d.parent(".photo-gallery").find("img"),
        i = h.length,
        j = (g.attr("data-id"), g.attr("data-hit")),
        k = 50,
        l = [];
        l.push('<div class="pop-mod">'),
        l.push('<div class="mask">&nbsp;</div>'),
        l.push('<div id="j_popCommentControl" class="pop-comment-control wrap-box clearfix">'),
        l.push('<div class="control-main fl">'),
        l.push('<div class="photo-viewer carousel-main">'),
        l.push('<div class="focus-photo tc">'),
        l.push('<img src="' + g.attr("src").replace("h=170", "h=635") + '" alt="" class="init-pic">'),
        l.push('<div class="text-bar">'),
        l.push('<div class="bar-mask">&nbsp;</div>'),
        l.push('<div class="text-cont f14 tc"><p class="text-ellipsis">' + g.attr("alt") + "</p></div>"),
        l.push("</div>"),
        l.push("</div>"),
        l.push('<div class="btn-box hide">'),
        l.push('<a href="javascript:void(0);" class="btn-prev icon-common-main png">prev</a>'),
        l.push('<a href="javascript:void(0);" class="btn-next icon-common-main png">next</a>'),
        l.push("</div>"),
        l.push("</div>"),
        l.push('<div class="slide-bar carousel-side mt10">'),
        l.push('<div class="viewport">'),
        l.push('<div class="slides_container clearfix tc">'),
        l.push('<div class="item clearfix">'),
        h.each(function(a) {
            var b = $(this),
            c = b.attr("data-id"),
            d = b.attr("data-hit"),
            e = b.attr("alt"),
            g = b.attr("src");
            a > 0 && a % 5 == 0 && (l.push("</div>"), l.push('<div class="item clearfix">')),
            l.push(a == f ? '<a href="javascript:void(0);" data-id="' + c + '" data-hit="' + d + '" class="on"><img src="' + g + '" data-src="#picUrl" alt="' + e + '"></a>': '<a href="javascript:void(0);" data-id="' + c + '" data-hit="' + d + '"  ><img src="' + g + '" data-src="#picUrl" alt="' + e + '"></a>')
        }),
        l.push("</div>"),
        l.push("</div>"),
        l.push('<a href="javascript:void(0);" class="slide-comm-prev buttons"><div class="arrow-box f20 songti lh1"><em>◆</em><i>◆</i></div></a>'),
        l.push('<a href="javascript:void(0);" class="slide-comm-next buttons"><div class="arrow-box f20 songti lh1"><em>◆</em><i>◆</i></div></a>'),
        l.push("</div>"),
        l.push("</div>"),
        l.push("</div>"),
        l.push('<div class="centrol-side fr">'),
        l.push('<div class="centrol-toolbar clearfix">'),
        l.push('<a href="javascript:void(0);" class="btn-praise f666 f16 b fl"><i class="icon-praise mr5 vm icon-common-main png">&nbsp;</i><em class="vm">' + j + "</em></a>"),
        l.push('<ul class="share-list tc fr clearfix">'),
        l.push("<li class='list-item'><a href=\"javascript:eval(picShare('wb'));setPicFav('wb');void(0);\" class='btn-weibo'><i class='icon-weibo vm icon-common-main png'>&nbsp;</i></a></li>"),
        l.push("<li class='list-item'><a href=\"javascript:eval(picShare('qz'));setPicFav('qz');void(0);\" class='btn-qzone'><i class='icon-qzone vm icon-common-main png'>&nbsp;</i></a></li>"),
        l.push('<li class="list-item more-item">'),
        l.push('<a href="javascript:void(0);" class="btn-more"><i class="icon-more vm icon-common-main png">&nbsp;</i></a>'),
        l.push('<div class="more-box tl hide">'),
        l.push('<div class="arrow-box f20 songti lh1"><em>◆</em><i>◆</i></div>'),
        l.push('<ul class="more-share">'),
        l.push("<li><a href=\"javascript:eval(picShare('qt'));setPicFav('qt');void(0);\" class='btn-qqweibo'><i class='icon-qqweibo mr5 vm icon-common-main png'>&nbsp;</i>腾讯微博</a></li>"),
        l.push("<li><a href=\"javascript:eval(picShare('rr'));setPicFav('rr');void(0);\" class='btn-renren'><i class='icon-renren mr5 vm icon-common-main png'>&nbsp;</i>人人网</a></li>"),
        l.push("</ul>"),
        l.push("</div>"),
        l.push("</li>"),
        l.push("</ul>"),
        l.push("</div>"),
        l.push('<div class="centrol-cont-box">'),
        l.push('<div class="carousel-info f333">'),
        l.push('<span class="pager-info f22"><em class="f26">' + (f + 1) + "</em>/<i>" + i + "</i></span>"),
        l.push('<span class="info-cont ml5">' + g.attr("alt") + "</span>"),
        l.push("</div>"),
        l.push('<div class="message-box mt10 j_messageBox">'),
        l.push('<p class="txta-wrap"><textarea  id="txtTalkBackText" cols="30" maxlength="150" rows="10" class="txta f666 p5 j_txtArea"></textarea></p>'),
        l.push('<div class="ft-bar f999 mt5 clearfix">'),
        l.push('<div class="limit-num fl j_limitNum"><b>0</b>/150</div>'),
        l.push('<div class="bar-side fr">'),
        l.push(_uzw.user.userid ? '<span class="tips-info vm mr10">' + _uzw.user.userName + "</span>": '<span class="tips-info vm">回复需<a href="javascript:void(0);" class="btn-login u j_btnCommentLogin">登录</a></span>'),
        l.push('<a href="javascript:void(0);" class="btn-affirm tc ml10 vm">确认</a>'),
        l.push("</div>"),
        l.push("</div>"),
        l.push("</div>"),
        l.push("</div>"),
        l.push('<div class="reply-box" id="j_replyBox">');
        for (var m = 0; i > m; m++) l.push('<div class="item hide">'),
        l.push('<div class="total-bar pt10"><span>回复(<i>0</i>)</span></div>'),
        l.push('<div class="reply-list">'),
        l.push("<ul>"),
        l.push("</ul>"),
        l.push("</div>"),
        l.push("</div>");
        l.push("</div>"),
        l.push("</div>"),
        l.push('<div class="close-wrap"><a href="javascript:void(0);" class="pop-close yahei pointer fr"><i class="close-icon">&times;</i></a></div>'),
        l.push("</div>"),
        l.push("</div>"),
        $("body").append(l.join("")),
        a = $("#j_popCommentControl"),
        b = a.find(".carousel-side"),
        c = b.find(".viewport"),
        popMod("j_popCommentControl", k);
        var n = $(window).scrollTop();
        $("#j_popCommentControl").css({
            "margin-top": n - 305
        }),
        fixIe6("j_popCommentControl", k),
        e(f)
    },
    g = function(a) {
        var b = a.parent(".photo-gallery").parent("dd").attr("data-tid");
        $.ajax({
            type: "GET",
            url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=4&talkBackId=" + b,
            dataType: "jsonp",
            success: function(a) {
                var b = $("#j_replyBox");
                if (a && a.length > 0) for (var c = 0; c < a.length; c++) {
                    var d = a[c],
                    e = (d.ImgID, d.Reply),
                    f = e.length,
                    g = [];
                    if (g.push("<div class='total-bar pt10'><span>回复(<i>" + f + "</i>)</span></div>"), g.push("<div class='reply-list'><ul>"), e && e.length > 0) for (var h = 0; f > h; h++) {
                        var i = e[h],
                        j = i.UserName,
                        k = (i.HeadUrl, i.ReplyContent),
                        l = i.ReplyDate;
                        g.push("<li><span><em class='username'>" + j + "</em>：</span><span class='f333 pl5'>" + k + "</span><span class='reply-time f999 pl5'>" + l + "</span></li>")
                    }
                    g.push("</ul></div>"),
                    b.find(".item").eq(c).html(g.join(""))
                }
            },
            error: function() {}
        })
    },
    h = function(d) {
        var f = d.index(),
        g = c.find(".item").length,
        h = Math.floor(f / 5),
        i = function(a) {
            if (null != a.get(0)) if (g > 1) {
                a.slides({
                    preload: !0,
                    preloadImage: "http://r.uzaicdn.com/content/1/images/preload.gif",
                    currentClass: "on",
                    next: "slide-comm-next",
                    prev: "slide-comm-prev",
                    slideSpeed: 300,
                    slideEasing: "easeOutQuad",
                    effect: "slide",
                    hoverPause: !1,
                    pause: 1e3,
                    play: 0,
                    generateNextPrev: !1,
                    generatePagination: !1,
                    animationComplete: function(a) {}
                }),
                a.siblings(".buttons").show();
                for (var b = 0; h > b; b++) a.siblings(".slide-comm-next").click()
            } else a.siblings(".buttons").addClass("invalid")
        };
        i(c);
        var j = function() {
            var d = b.prev(".carousel-main"),
            f = d.find(".text-cont").find(".text-ellipsis"),
            g = c.find(".slides_container").find("a"),
            h = g.length,
            i = a.find(".pager-info");
            h > 1 && (d.on("mouseover",
            function() {
                var a = $(this);
                a.find(".btn-box").show()
            }).on("mouseout",
            function() {
                var a = $(this);
                a.find(".btn-box").hide()
            }), d.find(".btn-box").find("a").on("click",
            function() {
                var a = $(this),
                d = c.find("a.on"),
                e = g.index(d);
                "prev" == a.text() && e > 0 ? (e % 5 == 0 && b.find(".slide-comm-prev").click(), g.eq(e - 1).click(), i.find("em").text(e)) : "next" == a.text() && h > e + 1 && ((e + 1) % 5 == 0 && b.find(".slide-comm-next").click(), g.eq(e + 1).click(), i.find("em").text(e + 2))
            })),
            "" == f.text() && d.find(".text-bar").hide(),
            g.on("click",
            function() {
                {
                    var b = $(this),
                    c = b.find("img"),
                    g = c.attr("src"),
                    h = c.attr("alt"),
                    j = b.parents(".viewport").find("a"),
                    k = j.index(b),
                    l = b.attr("data-hit");
                    b.attr("data-id")
                }
                j.removeClass("on"),
                b.addClass("on"),
                d.find(".init-pic").attr("src", g.replace("h=170", "h=635")),
                i.find("em").text(k + 1),
                a.find(".carousel-info").find(".info-cont").text(h),
                "" == h ? d.find(".text-bar").hide() : (d.find(".text-bar").show(), f.text(h)),
                e(k);
                var m = a.find(".centrol-toolbar").find(".btn-praise");
                return "0" != l && m.find("em").text(l),
                !1
            })
        };
        j(),
        a.find(".share-list").find(".more-item").on("mouseover",
        function() {
            var a = $(this);
            a.find(".more-box").show()
        }).on("mouseout",
        function() {
            var a = $(this);
            a.find(".more-box").hide()
        }),
        a.find(".pop-close").on("click",
        function() {
            a.parents(".pop-mod").remove()
        })
    },
    i = function(a) {
        $(".j_btnCommentLogin").on("click",
        function() {
            _uzw.iframe.pop("http://u.uzai.com/QuickLogin?actionName=dianPingCB")
        }),
        $("#j_popCommentControl").find(".btn-affirm").on("click",
        function() {
            $(this);
            if (_uzw.user.userid) {
                var a = c.find("a.on").attr("data-id"),
                b = $.trim($("#txtTalkBackText").val());
                if (b.length <= 0) return void alert("请填写点评！");
                $.ajax({
                    type: "GET",
                    url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=5&talkBackId=" + d + "&imageId=" + a + "&content=" + escape(b),
                    dataType: "jsonp",
                    success: function(a) {
                        alert("回复成功，待审核通过后展示！")
                    },
                    error: function() {}
                })
            } else $(".j_btnCommentLogin").click()
        }),
        textareaLimit()
    },
    j = function(a) {
        function b(a) {
            var b = _uzw.cookie.get("uzwDingPics");
            if (b) {
                b = b + "|" + a;
                var c = _util.array.unique(b.split("|"));
                _uzw.cookie.set("uzwDingPics", c.join("|"), 1)
            } else _uzw.cookie.set("uzwDingPics", a, 1)
        }
        function d(a) {
            var b = !1,
            c = _uzw.cookie.get("uzwDingPics");
            if (c) {
                var d = c.split("|"),
                e = $.inArray(a, d);
                e > -1 && (b = !0)
            }
            return b
        }
        $(".btn-praise").on("click",
        function() {
            var a = $(this),
            e = c.find(".slides_container").find("a.on"),
            f = parseInt($.trim(a.find(".vm").text())),
            g = e.attr("data-id");
            d(g) || $.ajax({
                type: "GET",
                url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=6&imageId=" + g,
                dataType: "jsonp",
                success: function(d) {
                    if (d) {
                        b(g),
                        "success" == d.result ? a.find("em.vm").text(f + 1) : "much" == d.result;
                        var e = a.find("em.vm").text();
                        c.find("a.on").attr("data-hit", e),
                        $("#j_commentList").find(".item").find("img[data-id='" + g + "']").attr("data-hit", e)
                    }
                },
                error: function() {}
            })
        })
    }
}
function productLatest() {
    var a = $("#j_latestOrder");
    null != a.get(0) && setInterval(function() {
        var b = a.find("ul li").height();
        a.find("ul").animate({
            marginTop: "0px"
        },
        1e3, "easeInQuad",
        function() {
            $(this).find("li:last").prependTo(this),
            $(this).css({
                marginTop: -b + "px"
            });
            var c = a.html();
            a.html(c)
        })
    },
    5e3)
}
function skipPoint(a) {
    var b = $("#" + a);
    null == b.get(0) && (b = $("." + a));
    var c = b.offset().top;
    $("body,html").animate({
        scrollTop: c
    },
    800)
}
function productZixun() {
    var a = parseInt($("#j_zuxunCount").text());
    if (a = a || 0, 0 != a) {
        var b = $("#pcode").val(),
        c = 5,
        d = function(a, d) {
            var e = $.ajax({
                url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=3&pcode=" + b + "&pageSize=" + c + "&indexPage=" + a,
                type: "GET",
                dataType: "jsonp",
                contentType: "application/json; charset=utf-8"
            });
            e.done(function(a) {
                if (a) {
                    var b = a.data,
                    c = [];
                    c.push("<ul>");
                    for (var d = 0; d < b.length; d++) {
                        var e = b[d],
                        f = (e.id, e.userName, e.mContent),
                        g = e.editTime,
                        h = e.aContent;
                        c.push("<li>"),
                        c.push("<div class='advisory-hd clearfix'><div class='item-hd fl'><i class='icon-ask mr10 vm icon-product png'>&nbsp;</i><span class='hd-cont'>咨询内容：</span></div><div class='item-bd'><em class='ask-cont'>" + f + "</em><span class='date-box f999'>" + g + "</span></div></div>"),
                        c.push("<div class='advisory-bd pt10 clearfix'>"),
                        c.push("<div class='item-hd fl'><i class='icon-answer mr10 vm icon-product png'>&nbsp;</i><span class='hd-cont'>悠哉客服：</span></div>"),
                        c.push("<div class='item-bd'><em class='answer-cont'>" + h + "</em></div>"),
                        c.push("</div>"),
                        c.push("</li>")
                    }
                    c.push("</ul"),
                    $("#j_zixunList").html(c.join(""))
                }
            })
        };
        $("#zxPager").uzPager({
            pageSize: c,
            pageItems: a,
            targetLazyload: !0,
            targetLazyTag: "data-src",
            onInit: function(a) {
                d(1, a)
            },
            onCallback: function(a, b) {
                productLazy("j_commentList"),
                skipPoint("advisory-mod"),
                d(a, b)
            }
        })
    }
}
function commentPop() {
    var a = $("input#pid").val();
    $("#j_btnRemark").on("click",
    function() {
        var b = function() {
            var a = [],
            b = $.trim($("#pid").val());
            a.push('<div id="j_commentPopMod" class="pop-mod">'),
            a.push('<div class="pop-comment">'),
            a.push('<a href="javascript:void(0);" class="pop-close lh1">&times;</a>'),
            a.push('<div class="warn-box tc pt5"><i class="icon-warn icon-product png">&nbsp;</i></div>'),
            a.push('<div class="f18 yahei warn-tit"><em class="p10">您暂不能对该线路进行点评</em></div>'),
            a.push('<ul class="warn-cont f14 lh2">'),
            _uzw.user.userid || a.push('<li>您还未登录<a href="http://u.uzai.com/reguser?referUrl=/youlun/' + b + '.html" class="space songti">立即登录&gt;&gt;</a></li>'),
            a.push("<li>您可能没有在悠哉预订过该线路</li>"),
            a.push("<li>您已经评价过该线路</li>"),
            a.push("<li>您还未出行或归来</li>"),
            a.push("</ul>"),
            a.push("</div>"),
            a.push('<div class="mask">&nbsp;</div>'),
            a.push("</div>"),
            $("body").append(a.join(""));
            var c = 50;
            popMod("pop-comment", c),
            fixIe6("pop-comment", c),
            $("#j_commentPopMod").find(".pop-close").on("click",
            function() {
                $("#j_commentPopMod").remove()
            })
        };
        if (_uzw.user.userid) {
            var c = $.ajax({
                url: "http://sh.uzai.com/ashx/ashxCommon.ashx?type=7&pid=" + a,
                type: "GET",
                dataType: "jsonp",
                contentType: "application/json; charset=utf-8"
            });
            c.done(function(a) {
                a && "15249376900FD7FB" != a.result ? window.location.href = "http://u.uzai.com/manage/tour-record?oid=" + a: b()
            })
        } else b()
    })
}
function productFocus() {
    var a = function(a) {
        if (null != a.get(0)) {
            var b = a.find("li").length;
            b > 4 ? a.tinycarousel({
                axis: "y",
                infinite: !1
            }) : a.find(".buttons").hide(),
            a.find(".overview").find("li").on("click",
            function() {
                var b = $(this),
                c = b.find("img").attr("data-src"),
                d = b.siblings("li"),
                e = a.prev(".carousel-main");
                return d.removeClass("on"),
                b.addClass("on"),
                null != e.get(0) ? e.find("img").attr("src", c) : a.parents("#j_sliderZyxCodeFocus").prev(".carousel-main").find("img").attr("src", c),
                !1
            })
        }
    },
    b = function(a) {
        if (null != a.get(0)) {
            var b = a.find("li").length;
            b > 4 ? a.tinycarousel({
                axis: "x",
                infinite: !1
            }) : a.find(".buttons").hide(),
            a.find(".overview").find("li").on("click",
            function() {
                var b = $(this),
                c = b.find("img").attr("data-src"),
                d = b.siblings("li"),
                e = a.prev(".focus-pic");
                return d.removeClass("on"),
                b.addClass("on"),
                null != e.get(0) && e.find("img").attr("src", c),
                !1
            })
        }
    },
    c = $("#j_sliderCodeFocus");
    null != c.get(0) && a(c);
    var d = $("#j_sliderZyxCodeFocus");
    if (null != d.get(0)) {
        var e = d.find(".item").eq(0);
        a(e),
        d.find(".hd").find("li").click("on",
        function() {
            var b = $(this),
            c = b.siblings("li"),
            e = b.index(),
            f = b.parents(".hd").next(".bd").children(".item"),
            g = f.eq(e),
            h = g.find(".on").find("img").attr("data-src"),
            i = d.prev(".carousel-main").find("img");
            c.removeClass("on"),
            b.addClass("on"),
            f.hide(),
            g.show(),
            i.attr("src", h),
            e > 0 && a(g)
        })
    }
    var f = $("#j_sdbCarousel");
    null != f.get(0) && !
    function(a) {
        var b = a.find(".select-items"),
        c = b.find("li"),
        d = b.length,
        e = a.width();
        a.find(".viewport").width(e),
        b.width(e),
        d > 1 ? a.tinycarousel({
            axis: "x",
            infinite: !1
        }) : a.find(".buttons").hide(),
        c.on("click",
        function() {
            var a = $(this);
            c.removeClass("on"),
            a.addClass("on")
        })
    } (f);
    var g = $("#j_carouselBar");
    if (null != g.get(0)) {
        var h = screen.width;
        1152 >= h && g.find(".overview").find("li").css({
            width: 110,
            "margin-right": 12
        }),
        b(g)
    }
}
function latestOrderScroll() {
    var a = $.trim($("#pid").val()),
    b = $("#j_orderInfoBox");
    if (null != b.get(0)) {
        var c = b.find("ul"),
        d = function() {
            if (c.find("li").length > 0) {
                var a = function() {
                    var a = c.find("li").eq(0).outerHeight();
                    c.animate({
                        marginTop: -a + "px"
                    },
                    500,
                    function() {
                        var a = c.find("li:first");
                        c.css({
                            "margin-top": "0"
                        }),
                        c.append(a)
                    })
                },
                d = setInterval(a, 4e3);
                b.hover(function() {
                    d && (clearInterval(d), d = null)
                },
                function() {
                    d = setInterval(a, 4e3)
                })
            }
        };
        $.ajax({
            type: "GET",
            url: "/youlun/ashx/ashx_LvyoucnNewBooking.ashx?pid=" + a,
            dataType: "json",
            success: function(a) {
                if (a && "]" != a) {
                    for (var b = [], e = a, f = 0; f < e.length; f++) b.push("<li>" + e[f].phone + "&nbsp;预订" + e[f].num + "人出游(" + e[f].date + "前)</li>");
                    c.html(b.join("")),
                    d()
                }
            }
        })
    }
}
function productSlides() {
    var a = $("#j_routeTab"),
    b = a.children(".hd").find(".on").index(),
    c = a.children(".bd").children(".item").eq(b),
    d = c.find(".j_routePhotoList");
    unitSlide(d, c, b);
    var e = $(".j_youlunPhotoList");
    unitSlide(e, e, -1);
    var f = $(".j_productImageList");
    null != f.get(0) && f.slides({
        preload: !0,
        preloadImage: "http://r.uzaicdn.com/content/1/images/preload.gif",
        currentClass: "on",
        next: "slides-next",
        prev: "slides-prev",
        slideSpeed: 300,
        slideEasing: "easeOutQuad",
        effect: "slide",
        hoverPause: !1,
        pause: 1e3,
        play: 0,
        generateNextPrev: !1,
        generatePagination: !1,
        animationComplete: function(a) {
            f.each(function() {
                var a = $(this),
                b = a.find(".item"),
                c = b.find("img");
                c.each(function() {
                    var a = $(this),
                    b = a.attr("data-original");
                    a.attr("src", b)
                })
            })
        }
    }),
    fixScreen()
}
function fixScreen() {
    var a = screen.width,
    b = $(".j_routePhotoList"),
    c = b.find(".slides_container").find(".item"),
    d = b.eq(0).width(),
    e = $(".j_hotelPhotoList"),
    f = e.find(".slides_container").find(".item"),
    g = e.eq(0).width(),
    h = $(".j_youlunPhotoList"),
    i = h.find(".slides_container").find(".item"),
    j = h.eq(0).width(),
    k = $(".j_productImageList"),
    l = k.find(".slides_container").find(".item");
    1152 >= a ? (c.width(d + 4), f.width(g + 4), l.width("954px")) : (c.width(d + 5), f.width(g + 5), l.width("1153px")),
    i.width(j + 5)
}
function skipToCalendar() {
    var a = $("#j_smartCalendar").offset().top;
    return $("body,html").animate({
        scrollTop: a
    },
    500),
    !1
}
function tmNumControl() {
    var a = function(a) {
        null != a.get(0) && a.find("a").on("click",
        function() {
            var a = $(this),
            b = a.siblings("input"),
            c = parseInt(b.val());
            return a.hasClass("btn-up") ? 99 >= c && b.val(c + 1) : a.hasClass("btn-down") && c >= 1 && b.val(c - 1),
            !1
        })
    },
    b = $("#j_numControl");
    a(b);
    var c = $(".j_gtNumControl");
    a(c)
}
function smCalendar() {
    var a = $("#pid").val();
    if (a) {
        var b = new Date,
        c = b.getFullYear(),
        d = b.getMonth() + 1,
        e = b.getDate(),
        f = $("#hidFirstDay").val() || c + "-" + d + "-" + e,
        g = function(a, b, c) {
            {
                var d = $("#j_rlOrderBox");
                d.width(),
                d.height()
            }
            c && d.css({
                left: a,
                top: b + 51
            }).show(),
            d.find(".close").on("click",
            function() {
                return d.hide(),
                !1
            }),
            blankFix("j_blankFix", "j_rlOrderBox")
        },
        h = {
            jsonpUrl: "http://sh.uzai.com/ashx/ashx_Calendar.ashx?pid=" + a + "&type=1",
            isSmart: !0,
            latestDate: f,
            extCallBack: function(a, b) {
                var c = $("#j_jsonCalendarWrap"),
                d = c.find(".item"),
                e = c.find("a.block"),
                f = location.href.toLowerCase(),
                h = f.indexOf("/tour") > -1,
                i = f.indexOf("/trip/") > -1;
                h && c.length > 0 && e.powerFloat({
                    reverseSharp: !0,
                    position: "7-5",
                    target: "#j_smCalendarTipBox",
                    showCall: function(a) {
                        yhTips($(this), a)
                    }
                }),
                e.length > 0 && d.each(function(a, b) {
                    var c = $(this),
                    d = c.find("a.block"),
                    e = c.attr("data-day"),
                    f = c.attr("data-month"),
                    j = c.attr("data-year"),
                    k = j + "-" + f + "-" + e;
                    null != d.get(0) && c.on("click",
                    function() {
                        if (h) {
                            var a = $(this),
                            b = a.offset().left,
                            c = a.offset().top;
                            g(b, c, k);
                            var d = $("#j_rlOrderBox").find(".j_startDate"),
                            l = $(".product-intro-cont").find(".j_startDate"),
                            m = d.find("li[date=" + k + "]").html();
                            d.find(".selected-date").html(m),
                            l.find(".selected-date").html(m),
                            $("#hidGodate").val(k)
                        } else i && (skipToCalendar(), k = j + "-" + (1 == f.length ? "0" + f: f) + "-" + (1 == e.length ? "0" + e: e), $("#txtGoDate").val(k), $("#spanGodate").text(k), getContentTab_Modify(1))
                    })
                })
            },
            preCallback: function(a, b) {}
        },
        i = $("#j_smartCalendar");
        null != i.get(0) && $("#j_smartCalendar").jsonCalendar(h)
    }
}
function startDate() {
    var a = $(".j_startDate");
    a.on("mouseenter",
    function() {
        var a = $(this),
        b = a.find(".date-list");
        b.show()
    }).on("mouseleave",
    function() {
        var a = $(this),
        b = a.find(".date-list");
        b.hide()
    }),
    a.on("click", "li",
    function() {
        var a = $(this),
        b = a.parents("#j_rlOrderBox"),
        c = a.siblings("li"),
        d = a.html(),
        e = a.attr("date"),
        f = a.parent(".date-list").siblings(".selected-date");
        c.removeClass("on"),
        a.addClass("on"),
        f.html(d),
        a.parent(".date-list").hide(),
        null != b.get(0) ? $(".product-intro-cont").find(".selected-date").html(d) : $("#j_rlOrderBox").find(".selected-date").html(d),
        $("#hidGodate").val(e)
    })
}
function contentSwitch() {
    var a = $("#j_products"),
    b = $("#J_neatenInfo"),
    c = $("#j_recommBox"),
    d = b.hasClass("freedom-neaten-info") ? 120 : 96,
    e = b.find(".info-bd-main").children("ul");
    e.each(function() {
        var a = $(this),
        b = a.parents(".info-bd").find(".switch");
        a.height() <= d && b.hide()
    }),
    b.find(".switch").on("click",
    function() {
        var a = $(this),
        b = a.parents(".info-bd").find(".info-bd-main");
        "[ 收起 ]" === a.text() ? (b.css("height", d), a.text("[ 更多 ]")) : (b.css("height", "auto"), a.text("[ 收起 ]"))
    });
    var f = $("#j_correlateScenic");
    f.find(".scenic-items").each(function(a) {
        var b = $(this),
        c = b.find("a"),
        d = c.length;
        d > 15 && (b.next(".switch").show(), c.each(function(a) {
            a >= 15 && c.eq(a).hide()
        }))
    }),
    f.find(".switch").on("click",
    function() {
        var a = $(this),
        b = a.prev(".scenic-items").find("a");
        "[ 收起 ]" === a.text() ? (b.each(function(a) {
            a >= 15 && b.eq(a).hide()
        }), a.text("[ 更多 ]")) : (b.each(function(a) {
            a >= 15 && b.eq(a).show()
        }), a.text("[ 收起 ]"))
    });
    var g = a.find(".combo-hotel-info").find(".hotel-intro-box");
    g.find(".switch").on("click",
    function() {
        var a = $(this),
        b = a.prev(".hidden-cont");
        "收起" === a.text() ? (b.hide(), a.text("展开更多")) : (b.show(), a.text("收起"))
    });
    var h = a.find(".hotel-info-items"),
    i = h.find(".item-listing"),
    j = 14;
    i.each(function() {
        var a = $(this),
        b = a.find("li").length;
        b > 15 && (a.find("li:gt(" + j + ")").hide(), a.next(".switch-bar").show())
    }),
    h.find(".switch").on("click",
    function() {
        var a = $(this),
        b = a.parent().prev(".item-listing");
        "收起" === a.text() ? (b.find("li:gt(" + j + ")").hide(), a.text("展开更多")) : (b.find("li:gt(" + j + ")").show(), a.text("收起"))
    });
    var k = c.find(".recomm-cont").height();
    if (null != c.get(0) && k > 72) {
        var l = c.find(".arrow");
        l.show(),
        c.find(".recomm-inner").on("mouseenter",
        function() {
            var a = $(this);
            a.css("height", "auto"),
            l.addClass("arrow-on")
        }).on("mouseleave",
        function() {
            var a = $(this);
            a.css("height", 72),
            l.removeClass("arrow-on")
        })
    }
}
function selectList(a) {
    var b = $("#" + a);
    null == b.get(0) && (b = $("." + a));
    var c = b.find(".select-list-box");
    null != c.get(0) && (c.on("mouseenter",
    function() {
        var a = $(this);
        a.css("zIndex", 1).find(".select-list").show()
    }).on("mouseleave",
    function() {
        var a = $(this);
        a.css("zIndex", "auto").find(".select-list").hide()
    }), c.on("click", "li",
    function() {
        var a = $(this),
        b = a.text(),
        c = a.parent(".select-list"),
        d = c.prev(".num-box");
        c.hide(),
        d.val(b)
    }))
}
function imgPreview(a, b) {
    var c = $("<div/>").attr("id", "imgPreviewContainer").append("<img/>").hide().css("position", "absolute").appendTo("body"),
    d = $("img", c),
    e = a.find("img[" + b + "]");
    e.on("mousemove",
    function(a) {
        var b = $(window).width() - c.width() - 50,
        d = a.pageX > b ? b: a.pageX + 10;
        c.css({
            top: a.pageY + 10,
            left: d,
            zIndex: 99
        })
    }).hover(function() {
        var a = $(this);
        c.show(),
        d.load(function() {
            d.show().animate({
                opacity: 1
            },
            300)
        }).attr("src", a.attr(b))
    },
    function() {
        c.hide(),
        d.unbind("load").attr("src", "").hide().stop().css({
            opacity: 0
        })
    })
}


function setPicFav(a) {
    _uzw.cookie.set("uzaisharefav", 7)
}




function isEmptyObject(a) {
    for (var b in a) return ! 1;
    return ! 0
}



$(function() {

    productFocus();
});
var _productNav = {
    box: {},
    bar: {},
    side: {},
    mods: {},
    barH: 0,
    initCall: function() {
        _productNav.init(),
        _productNav.navDispose(),
        _productNav.unitScroll()
    },
    init: function() {
        _productNav.box = $("#j_products"),
        _productNav.bar = _productNav.box.find(".product-nav-fixed"),
        _productNav.side = _productNav.bar.find(".product-nav-side"),
        _productNav.mods = _productNav.box.find(".slice-mod"),
        _productNav.barH = _productNav.bar.height()
    },
    navDispose: function() {
        var a = (_productNav.box, _productNav.bar),
        b = _productNav.side,
        c = _productNav.mods,
        d = _productNav.barH;
        a.find("li").on("click",
        function() {
            var a = $(this),
            b = a.index(),
            e = c.eq(b),
            f = e.offset().top;
            $("body,html").animate({
                scrollTop: f - d + 5
            },
            800)
        }),
        b.find(".btn-order").on("click",
        function() {
            var a = $(this),
            b = $(".product-intro").offset().top,
            c = $("#j_bookingInfo"),
            d = $("#j_preOrder"),
            e = 0,
            f = 0;
            null != c.get(0) && (e = c.offset().top),
            null != d.get(0) && (f = d.offset().top),
            a.hasClass("zyx-product-order") ? $("body,html").animate({
                scrollTop: e
            },
            800) : a.hasClass("yl-product-order") ? $("body,html").animate({
                scrollTop: f
            },
            800) : $("body,html").animate({
                scrollTop: b
            },
            800)
        })
    },
    fixColor: function(a) {
        var b = _productNav.bar,
        c = b.find("li");
        c.removeClass("on"),
        c.eq(a).addClass("on")
    },
    unitScroll: function() {
        var a = _productNav.box;
        if (!isEmptyObject(a)) {
            var b = _productNav.bar,
            c = _productNav.side,
            d = _productNav.mods,
            e = _productNav.barH,
            f = a.offset().top,
            g = $(window),
            h = g.scrollTop();
            h >= f ? (b.css(_util.check.isIE6 ? {
                top: h,
                position: "absolute"
            }: {
                position: "fixed",
                top: "0"
            }), c.show()) : (b.css({
                position: "static",
                top: "auto"
            }), c.hide()),
            d.each(function(a, b) {
                var c = $(this),
                d = c.offset().top;
                h >= d - e && _productNav.fixColor(a)
            })
        }
    }
},
_routeTab = {
    obj: {},
    box: {},
    nav: {},
    mods: {},
    initTop: 0,
    navH: 0,
    barH: 0,
    iEnd: 0,
    iNI: 0,
    oIndex: 0,
    iIndex: 0,
    initCall: function() {
        _routeTab.init(),
        _routeTab.tabDispose(),
        _routeTab.navDispose(),
        _routeTab.unitScroll()
    },
    init: function() {
        _routeTab.obj = $("#j_routeTab"),
        null != _routeTab.obj.get(0) && (_routeTab.box = _routeTab.obj.find(".bd").children(".item").eq(_routeTab.oIndex), _routeTab.nav = _routeTab.box.find(".route-navbar"), isEmptyObject(_routeTab.nav) || (_routeTab.nav.css({
            position: "static",
            top: "auto"
        }), _routeTab.mods = _routeTab.box.find(".route-detail-hd"), _routeTab.initTop = _routeTab.nav.offset().top, _routeTab.navH = _routeTab.nav.height(), _routeTab.barH = $("#j_products").find(".product-nav-fixed").height(), _routeTab.iEnd = _routeTab.obj.parents(".route-intro").next().offset().top - _routeTab.navH - 20, _routeTab.iNI = 35))
    },
    tabDispose: function() {
        var a = _routeTab.obj,
        b = _routeTab.nav;
        a.find(".hd").find("li").on("click",
        function() {
            var c = $(this),
            d = c.siblings("li");
            index = _routeTab.oIndex = c.index(),
            d.removeClass("on"),
            c.addClass("on");
            var e = c.parents(".hd").next(".bd"),
            f = e.children(".item");
            f.hide(),
            f.eq(index).show(),
            f.eq(index).find(".route-navbar").find("li").removeClass("on").eq(0).addClass("on"),
            b.css({
                position: "static",
                top: "auto"
            }),
            _routeTab.init(),
            _routeTab.navDispose();
            var g = index,
            h = a.children(".bd").children(".item").eq(g),
            i = h.find(".j_routePhotoList");
            unitSlide(i, h, index)
        })
    },
    navDispose: function() {
        var a = _routeTab.nav;
        if (!isEmptyObject(a)) {
            var b = _routeTab.mods,
            c = _routeTab.barH,
            d = _routeTab.iNI;
            a.find("li").on("click",
            function() {
                var a = $(this);
                iIndex = _routeTab.iIndex = a.index();
                var e = b.eq(iIndex),
                f = e.offset().top,
                g = f - c - d * iIndex - 5;
                $("body,html").animate({
                    scrollTop: g
                },
                1e3)
            })
        }
    },
    fixColor: function(a) {
        var b = _routeTab.nav,
        c = b.find("li");
        c.removeClass("on"),
        c.eq(a).addClass("on")
    },
    unitScroll: function() {
        var a = (_routeTab.obj, _routeTab.nav),
        b = _routeTab.mods,
        c = _routeTab.initTop,
        d = _routeTab.barH,
        e = _routeTab.iEnd,
        f = _routeTab.iNI,
        g = $(window),
        h = g.scrollTop();
        isEmptyObject(a) || (a.css(h >= c - d - 6 && e - d > h ? {
            position: "fixed",
            top: d + 5
        }: h >= e - d ? {
            position: "absolute",
            top: e
        }: {
            position: "static",
            top: "auto"
        }), b.each(function(a, b) {
            var c = $(this),
            e = c.offset().top;
            e - d - f * _routeTab.iIndex - 6 <= h && _routeTab.fixColor(a)
        }))
    }
},
_zyxSideOrder = {
    box: {},
    initTop: 0,
    bh: 0,
    iEnd: 0,
    initCall: function() {
        var a = location.href.toLowerCase(); (a.indexOf("/trip/") > -1 || a.indexOf("ziyouxing.html") > -1) && (_zyxSideOrder.init(), _zyxSideOrder.unitScroll())
    },
    init: function() {
        _zyxSideOrder.box = $("#j_orderbox"),
        null != _zyxSideOrder.box.get(0) && (_zyxSideOrder.initTop = _zyxSideOrder.box.offset().top, _zyxSideOrder.bh = _zyxSideOrder.box.height(), _zyxSideOrder.iEnd = $("#j_products").offset().top - _zyxSideOrder.bh - 40)
    },
    unitScroll: function() {
        var a = _zyxSideOrder.box,
        b = _zyxSideOrder.initTop,
        c = (_zyxSideOrder.bh, _zyxSideOrder.iEnd),
        d = $(window),
        e = d.scrollTop(),
        f = location.href.toLowerCase(); (f.indexOf("/trip/") > -1 || f.indexOf("ziyouxing.html") > -1) && !isEmptyObject(a) && a.css(e >= b && c > e ? {
            position: "fixed",
            top: 0
        }: e >= c ? {
            position: "absolute",
            top: c
        }: {
            position: "static",
            top: "auto"
        })
    }
},
unitSlide = function(a, b, c) {
    var d = b.data("slide");
    if (! (d >= 0)) {
        var e = a;
        null != e.get(0) && (e.each(function(a) {
            var b = $(this),
            c = b.find(".item").length;
            c > 1 && (b.find(".slides-prev").show(), b.find(".slides-next").show(), b.slides({
                preload: !0,
                preloadImage: "http://r.uzaicdn.com/content/1/images/preload.gif",
                currentClass: "on",
                next: "slides-next",
                prev: "slides-prev",
                slideSpeed: 300,
                slideEasing: "easeOutQuad",
                effect: "slide",
                hoverPause: !1,
                pause: 1e3,
                play: 0,
                generateNextPrev: !1,
                generatePagination: !1,
                slidesLoaded: function(a) {
                    var c = b.find(".slides-prev,.slides-next");
                    c.on("click",
                    function() {
                        var a = $(this),
                        b = a.parents().find(".slides_container"),
                        c = b.find("img");
                        c.each(function() {
                            var a = $(this),
                            b = a.attr("data-original");
                            b != a.attr("src") && a.attr("src", b)
                        })
                    })
                }
            }))
        }), imgPreview(e, "data-original")),
        b.data("slide", c)
    }
},
yhTips = function(a, b) {
    var c = function(a) {
        var b = [];
        if (null != a.get(0)) {
            var c = a.find(".cheap-item");
            c.each(function() {
                var a = $(this),
                c = parseInt(a.attr("data-price")),
                d = a.attr("data-max"),
                e = a.attr("data-desc"),
                f = a.attr("data-tag"),
                g = "";
                c && (g = "<p><b class='t" + d + "'>立减￥" + c + "</b></p>"),
                b.push("<div class='clearfix item'><div class='fl mr10'><i>" + f + "</i></div><div class='fl'>" + g + "<p>" + e + "</p></div></div>")
            })
        }
        return b.length > 0 ? "<div class='cheap-items'>" + b.join("") + "</div>": ""
    },
    d = parseInt($.trim(a.find(".price").text().replace("￥", ""))),
    e = parseInt($.trim(a.find(".price-cheap").text())),
    f = a.find(".cheap-ext").html(),
    g = $.trim(a.find(".date").text()),
    h = $.trim(a.find(".end-date").text()),
    i = $.trim(a.find(".end-time").text()),
    j = [];
    if (e && j.push("<p>优惠价<b>" + (d - e) + "</b>元 = 悠哉价<b>" + d + "</b>元 - 最大优惠价格<b>" + e + "</b>元</p>"), f && j.push(c(a.find(".cheap-ext"))), h) {
        var i = i,
        k = "上午";
        parseInt(i.substring(0, 2), 10) > 12 && (k = "下午"); {
            a.offset().top + 45,
            a.offset().left
        }
        j.push("<p>" + g + "出发团队</p>"),
        j.push("<p>" + h + k + i + "截止收取签证材料</p>")
    }
    j.length > 0 ? b.html(j.join("")) : $.powerFloat.hide()
},
_lm = {
    divName: "j_messageBox",
    textareaName: "j_txtArea",
    numName: "j_limitNum",
    num: 150,
    checkChinese: !0
},
textareaLimit = function() {
    function a(a) {
        var b = /[u00-uff]/;
        return ! b.test(a)
    }
    function b() {
        var b = 0,
        f = $.trim(c.val());
        if ("" != f) {
            for (var g = 0; g < f.length; g++) b += 1 == a(f.charAt(g)) && j ? 2 : 1;
            b = Math.ceil(b / 2),
            e.html(0 > i - b ? "<b style='color:red;' class=" + h + ">" + Math.abs(i - b) + "</b>/" + i: "<b class=" + h + ">" + b + "</b>/" + i),
            d.html(i - b)
        }
    }
    var c, d, e, f = _lm.divName,
    g = _lm.textareaName,
    h = _lm.numName,
    i = _lm.num,
    j = _lm.checkChinese;
    $("." + g).on("keyup",
    function() {
        d = $("." + f).find("." + h).find("b"),
        e = d.parent(),
        c = $(this);
        setInterval(b, 500)
    })
},
_up = {
    collect: {
        check: function() {
            var a = $("#pid").val(),
            b = _uzw.cookie.get("uzwRouteFav");
            if (b) {
                var c = b.split("|"),
                d = $.inArray(a, c);
                d > -1 ? ($("#addFav").hide(), $("#haveFav").show()) : _uzw.user.userid && $.ajax({
                    type: "GET",
                    url: "http://sh.uzai.com/ashx/ashx_Favourite.ashx?type=1&pid=" + a,
                    dataType: "jsonp",
                    success: function(b) {
                        b && "1" == b && ($("#addFav").hide(), $("#haveFav").show(), c.push(a), _uzw.cookie.set("uzwRouteFav", c.join("|")))
                    },
                    error: function() {}
                })
            }
        },
        add: function() {
            var a = $("#pid").val();
            _uzw.user.refresh();
            var b = $("#pcode").val(),
            c = $("h1.product-hd").text(),
            d = $("#tClass").val(),
            e = _uzw.cookie.get("uzwRouteFav");
            $.ajax({
                type: "GET",
                url: "http://sh.uzai.com/ashx/ashx_Favourite.ashx?type=2&pid=" + a + "&pCode=" + b + "&tid=" + d + "&pName=" + escape(c),
                dataType: "jsonp",
                success: function(b) {
                    if (b && (parseInt(b.result) > 0 || -1 == parseInt(b.result))) if ($("#addFav").hide(), $("#haveFav").show(), e) {
                        var c = e.split("|");
                        c.push(a),
                        _uzw.cookie.set("uzwRouteFav", c.join("|"))
                    } else _uzw.cookie.set("uzwRouteFav", a);
                    else alert("对不起，收藏失败，请重新收藏！")
                },
                error: function() {
                    alert("对不起，收藏失败，请重新收藏！")
                }
            })
        },
        cancle: function() {
            _uzw.user.refresh();
            var a = $("#pid").val(),
            b = _uzw.cookie.get("uzwRouteFav");
            $.ajax({
                type: "GET",
                url: "http://sh.uzai.com/ashx/ashx_Favourite.ashx?type=3&pid=" + a,
                dataType: "jsonp",
                success: function(c) {
                    if (c && (parseInt(c.result) > 0 || -1 == parseInt(c.result))) {
                        if ($("#addFav").show(), $("#haveFav").hide(), b) {
                            var d = b.split("|"),
                            e = $.inArray(a, d);
                            e > -1 && (d.splice(e, 1), _uzw.cookie.set("uzwRouteFav", d.join("|")))
                        }
                    } else alert("取消收藏失败，请重试！")
                }
            })
        }
    }
};
