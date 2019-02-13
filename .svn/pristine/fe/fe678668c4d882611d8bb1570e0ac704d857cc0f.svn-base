/**
 * @fileOverview 验证码工具类
 * @version 1.0.0
 */
define(function (require, exports) {
    'use strict';

    /**
     * 更新验证码
     * @param url 更改验证码后台url
     * @param element 验证码img元素
     * @return {boolean} 阻止默认事件
     * @private
     */
    function _changeCaptcha(url,element){
        $(element).attr("src", url + "?" + new Date().getMilliseconds());
        return false;
    }

    /**
     * 为DOM元素绑定点击更新验证码事件
     * @param captchaUrl 验证码url
     * @param element DOM元素
     */
    function _bindClickEvent(captchaUrl,element){
        $(element).click(function(){
            _changeCaptcha( captchaUrl,element);
            return false;
        });
    }

    //对外暴露更新验证码函数
    exports.changeCaptcha = _changeCaptcha;

    //对外暴露为DOM元素绑定点击更新验证码事件
    exports.bindClickEvent = _bindClickEvent;

    /**
     * 初始化验证码相关功能
     * @param options
     *      captchaUrl [string] : 验证码请求服务器端url
     *      imgId      [string] : 验证码图片img元素id
     *      reloadId   [string] : 换一张元素id
     */
    exports.init = function(options){
        var defaultSettings = {
            captchaUrl : $("#captchaUrl").val(),
            imgId : 'captchaImg',
            reloadId : 'captchaReloadImg'
        },
        settings = $.extend(defaultSettings,options);
        _changeCaptcha(settings.captchaUrl,'#'+settings.imgId);// 初始化验证码
        _bindClickEvent(settings.captchaUrl,'#'+settings.imgId+',#'+settings.reloadId);//生成验证码图片,当click触发时生成新验证码
    };

});
